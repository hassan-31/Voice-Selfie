//
//  SettingsViewController.m
//  SelfieVoice
//
//  Created by Muhammad Hassan on 13/11/2015.
//  Copyright © 2015 Hassan. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@end

@implementation SettingsViewController

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
