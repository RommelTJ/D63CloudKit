//
//  ViewController.m
//  D63CloudKit
//
//  Created by Rommel Rico on 2/19/15.
//  Copyright (c) 2015 Rommel Rico. All rights reserved.
//

#import "ViewController.h"
@import CloudKit;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Step 1. Initialize CKContainer.
    CKContainer *container = [CKContainer defaultContainer];
    NSLog(@"Container: %@", container);
    NSLog(@"%@", container.containerIdentifier);
    NSLog(@"%@", container.privateCloudDatabase);
    NSLog(@"%@", container.publicCloudDatabase);
    
    //Step 2. Ask for account status of container.
    [container accountStatusWithCompletionHandler:^(CKAccountStatus accountStatus, NSError *error) {
        
        //NOTE: All this completion handler code is running on a thread other than the main thread.
        switch (accountStatus) {
            case CKAccountStatusAvailable: {
                NSLog(@"Status Available");
                
                //Step 3. Create record.
                CKRecord *myRecord = [[CKRecord alloc] initWithRecordType:@"Student"];
                [myRecord setObject:[NSDate date] forKey:@"date"];
                
                //Step 4. Write record.
                [container.privateCloudDatabase saveRecord:myRecord completionHandler:^(CKRecord *record, NSError *error) {
                    NSLog(@"Error: %@", error);
                    NSLog(@"Record: %@", record);
                    
                    //Step 5. Now read the record from iCloud using Cloud Kit.
                    [container.privateCloudDatabase fetchRecordWithID:record.recordID completionHandler:^(CKRecord *myInputRecord, NSError *error) {
                        NSLog(@"Error: %@", error);
                        NSLog(@"Input Record: %@", myInputRecord);
                    }];
                }];
                
                break;
            }
            case CKAccountStatusCouldNotDetermine:
                NSLog(@"Status Could Not Determine");
                break;
            case CKAccountStatusNoAccount: {
                NSLog(@"Status No Account");
                //Open the iPhone Settings for the user.
                NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
                [[UIApplication sharedApplication] openURL:url];
                break;
            }
            case CKAccountStatusRestricted:
                NSLog(@"Status Restricted");
                break;
            default:
                break;
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
