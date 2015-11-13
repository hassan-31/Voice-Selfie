//
//  BaseViewController.m
//  OddJobs
//
//  Created by Muhammad Hassan on 25/10/2015.
//  Copyright © 2015 Hassan. All rights reserved.
//

#import "BaseViewController.h"

// Regular classes
#import "WelcomeViewController.h"
#import "RegisterViewController.h"

@interface BaseViewController ()
@end

@implementation BaseViewController

#pragma mark - View life cycle
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    if ([self isKindOfClass:[WelcomeViewController class]] || [self isKindOfClass:[RegisterViewController class]] || [self isKindOfClass:[RegisterViewController class]]) {
        
        self.navigationController.navigationBarHidden       = true;
        [UIApplication sharedApplication].statusBarHidden   = true;
        
        
    } else {
        
        self.navigationController.navigationBarHidden       = false;
        [UIApplication sharedApplication].statusBarHidden   = false;
        
    }
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    
    return UIStatusBarStyleLightContent;
    
}

@end
