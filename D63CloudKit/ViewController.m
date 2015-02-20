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
    
    //Step 2.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
