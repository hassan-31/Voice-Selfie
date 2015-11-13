//
//  ProfileViewController.m
//  SelfieVoice
//
//  Created by Muhammad Hassan on 13/11/2015.
//  Copyright © 2015 Hassan. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@end

@implementation ProfileViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    
    [super viewDidLoad]; [self setupView];

}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
}

- (void)setupView {
    
    self.navigationItem.titleView = lbl_title;
    
}

@end
