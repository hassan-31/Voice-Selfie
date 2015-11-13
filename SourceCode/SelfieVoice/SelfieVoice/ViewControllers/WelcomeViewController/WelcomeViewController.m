//
//  ViewController.m
//  SelfieVoice
//
//  Created by Muhammad Hassan on 12/11/2015.
//  Copyright © 2015 Hassan. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()
@end

@implementation WelcomeViewController

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
    
    bg_login.layer.cornerRadius         = view_email.layer.cornerRadius = 5.0;
    
    // Set UITextField left margin
    tf_email.leftView                   = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    tf_email.leftViewMode               = UITextFieldViewModeAlways;
    
    tf_forgetPassword.leftView          = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    tf_forgetPassword.leftViewMode      = UITextFieldViewModeAlways;
    
    tf_password.leftView                = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 40)];
    tf_password.leftViewMode            = UITextFieldViewModeAlways;
    
}

#pragma mark - Helper methods
- (void)changeColorOnIncompleteFields:(BOOL)isLoginView {
    
    // Set UITextField placeholder text color white
    if (tf_email.text.length == 0 && isLoginView) {
        
        tf_email.attributedPlaceholder      = [[NSAttributedString alloc] initWithString:@"Email Address" attributes:@{NSForegroundColorAttributeName: LIGHT_RED_COLOR}];
        
    }
    
    if (tf_password.text.length == 0 && isLoginView) {
        
        tf_password.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: LIGHT_RED_COLOR}];
        
    }
    
    if (tf_forgetPassword.text.length == 0 && !isLoginView) {
        
        tf_forgetPassword.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Email Address" attributes:@{NSForegroundColorAttributeName: LIGHT_RED_COLOR}];
        
    }
    
}

#pragma mark - IBaction methods
- (IBAction)btnOpenRegisterView_action:(UIButton *)sender {
    
    RegisterViewController *registerVC = [Utility getViewController:REGISTER_VIEWCONTROLLER];
    
    [self.navigationController pushViewController:registerVC animated:true];
    
}

- (IBAction)btnFBLogin_action:(UIButton *)sender {
    
    [Utility showActivity];
    
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    
    [login logInWithReadPermissions: @[@"public_profile", @"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        
        [Utility dismissActivity];
        
        if (error) {
            
            [Utility showAlertView:kAlerttitle Message:@"An error occured while facebook login." OKText:@"OK"];
            
        } else if (result.isCancelled) {
            
            [Utility showAlertView:kAlerttitle Message:@"You've cancelled facebook login process." OKText:@"OK"];
            
        } else {
            
            if ([result.grantedPermissions containsObject:@"email"]) {
                
                if ([FBSDKAccessToken currentAccessToken]) {
                    
                    [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields": @"first_name, last_name, picture, email, name"}]
                     startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
                         
                         if (!error) {
                             
                             [Utility dismissActivity];
                             
                             [self continueWithSocialLogin:(NSDictionary *)(result)];
                             
                             
                         } else {
                             
                             [Utility showAlertView:kAlerttitle Message:@"An error occured while fetching user info from facebook. Please try again." OKText:@"OK"];
                         }
                         
                     }];
                }
            }
            
        }
    }];
    
}

- (void)continueWithSocialLogin:(NSDictionary *)dictUser {
    
    [Utility showActivity];
    
    PFQuery *query  = [PFQuery queryWithClassName:@"_User"];
    [query  whereKey:@"email" equalTo:[dictUser valueForKey:@"email"]];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        [Utility dismissActivity];
        
        if (!error) {
            
            if (objects.count != 0) {
                
                PFUser *tempUser = (PFUser *)[objects lastObject];
                
                [Utility showActivity];
                
                [PFUser logInWithUsernameInBackground:tempUser.username password:@"1234" block:^(PFUser *user, NSError *error) {
                    
                    [Utility dismissActivity];
                    
                    if (user) {
                        
                        [UserInfo instance].firstName       = user[@"firstName"];
                        [UserInfo instance].lastName        = user[@"lastName"];
                        [UserInfo instance].fullName        = user[@"fullName"];
                        [UserInfo instance].phoneNumber     = user[@"phoneNumber"];
                        
                        PFFile *imgFile                     = user[@"profileImg"];
                        
                        [UserInfo instance].imgProfileURL   = imgFile.url;
                        
                        [UserInfo instance].facebokId       = user.objectId;
                        [UserInfo instance].emailAddress    = user.email;
                        
                        [UserInfo instance].isLogin         = true;
                        
                        [[UserInfo instance] saveUserInfo];
                        
                        // Set root view controller
                        [Utility setupTabBarController:[[UIApplication sharedApplication].delegate window]];
                        
                        
                    } else {
                        
                        NSString *alertMsg = nil;
                        
                        if (error) {
                            
                            // Something else went wrong
                            alertMsg = [error userInfo][@"error"];
                            
                        } else {
                            
                            // the username or password is probably wrong.
                            alertMsg = @"Couldn’t log in:\nThe username or password were wrong.";
                            
                        }
                        
                    }
                    
                }];
                
            } else {
                
                PFUser *newUser     = [PFUser user];
                
                [newUser setEmail:[dictUser valueForKey:@"email"]];
                [newUser setPassword:@"1234"];
                [newUser setObject:[dictUser valueForKey:@"name"] forKey:@"fullName"];
                [newUser setObject:[dictUser valueForKey:@"first_name"] forKey:@"firstName"];
                [newUser setObject:[dictUser valueForKey:@"last_name"] forKey:@"lastName"];
                [newUser setObject:[dictUser valueForKey:@"last_name"] forKey:@"phoneNumber"];
                [newUser setObjectId:[dictUser valueForKey:@"id"]];
                
                [Utility showActivity];
                
                [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                    
                    [Utility dismissActivity];
                    
                    if (!error) {
                        
                        if (succeeded) {
                            
                            [UserInfo instance].firstName       = [dictUser valueForKey:@"first_name"];
                            [UserInfo instance].language        = [dictUser valueForKey:@"last_name"];
                            [UserInfo instance].fullName        = [dictUser valueForKey:@"name"];
                            [UserInfo instance].facebokId       = [dictUser valueForKey:@"id"];
                            [UserInfo instance].emailAddress    = [dictUser valueForKey:@"email"];
                            
                            [UserInfo instance].isLogin     = true;
                            
                            [[UserInfo instance] saveUserInfo];
                            
                            // Set root view controller
                            [Utility setupTabBarController:[[UIApplication sharedApplication].delegate window]];
                            
                        }
                        
                    } else {
                        
//                        [Utility showAlertView:ALERT_TITLE Message:@"There is an error please try again." OKText:@"OK"];
                        
                    }
                    
                }];
                
            }
            
        } else {
            
//            [Utility showAlertView:kNetworkTitle Message:kNetworkMessage OKText:@"OK"];
            
        }
    }];
    
}

- (IBAction)btnLogin_action:(id)sender {
    
    if (tf_email.text.length == 0 || tf_password.text.length == 0) {
        
        [Utility shakeView:view_container]; [self changeColorOnIncompleteFields:true];
        
        return;
        
    }
    
    [self.view endEditing:true];
    
    PFQuery *query  = [PFQuery queryWithClassName:@"_User"];
    [query          whereKey:@"email" equalTo:tf_email.text];
    
    [Utility showActivity];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        [Utility dismissActivity];
        
        if (!error) {
            
            if (objects.count != 0) {
                
                PFUser *tempUser = (PFUser *)[objects lastObject];
                
                [Utility showActivity];
                
                [PFUser logInWithUsernameInBackground:tempUser.username password:tf_password.text block:^(PFUser *user, NSError *error) {
                    
                    [Utility dismissActivity];
                    
                    if (user) {
                        
                        [UserInfo instance].isLogin         = true;
                        [UserInfo instance].emailAddress    = user.email;
                        [UserInfo instance].userId          = user.objectId;
                        
                        [UserInfo instance].firstName       = user[@"firstName"];
                        [UserInfo instance].lastName        = user[@"lastName"];
                        [UserInfo instance].fullName        = user[@"fullName"];
                        [UserInfo instance].phoneNumber     = user[@"phoneNumber"];
                        
                        
                        PFFile *imgFile                     = user[@"profileImg"];
                        
                        [UserInfo instance].imgProfileURL   = imgFile.url;
                        
                        [[UserInfo instance]            saveUserInfo];
                        
                        [Utility setupTabBarController:[[UIApplication sharedApplication].delegate window]];
                        
                    } else {
                        
                        NSString *alertMsg = nil;
                        
                        if (error) {
                            
                            // Something else went wrong
                            alertMsg = [error userInfo][@"error"];
                            
                        } else {
                            
                            // the username or password is probably wrong.
                            alertMsg = @"Couldn’t log in:\nThe username or password were wrong.";
                            
                        }
                        
//                        [Utility showAlertView:ALERT_TITLE Message:alertMsg OKText:@"OK"];
                        
                    }
                    
                }];
                
            } else {
                
//                [Utility showAlertView:ALERT_TITLE Message:@"No record found, please enter correct email or password." OKText:@"OK"];
                
            }
            
        } else {
            
//            [Utility showAlertView:kNetworkTitle Message:kNetworkMessage OKText:@"OK"];
            
        }
    }];
    
}

// Email Text change action
- (IBAction)textDidChange_action:(UITextField *)sender {
    
    if ([sender isEqual:tf_email]) {
        
        if (sender.text.length == 0) {
            
            btnClear1.hidden = true;
            
        } else {
            
            btnClear1.hidden = false;
            
        }
        
        [Utility evaluateEmail:tf_email.text] ? ({img_email_ok_1.hidden = false; btnClear1.hidden = true;}) : (img_email_ok_1.hidden = true);
        
    } else {
        
        if (sender.text.length == 0) {
            
            btnClear2.hidden = true;
            
        } else {
            
            btnClear2.hidden = false;
            
        }
        
        [Utility evaluateEmail:tf_forgetPassword.text] ? ({img_email_ok_2.hidden = false; btnClear2.hidden = true;}) : (img_email_ok_2.hidden = true);
        
    }
    
}

- (IBAction)btnForgetPassword_action:(id)sender {
    
    [tf_forgetPassword becomeFirstResponder];
    
    [UIView transitionWithView:view_container
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations: ^{
                        
                        view_forgetPassword.hidden = false;
                        view_login.hidden = true;
                    }
     
                    completion:^(BOOL finished) {
                        
                        lbl_title.text = @"reset password";
                        
                    }];
    
}

- (IBAction)btnCancel_action:(id)sender {
    
    [tf_email becomeFirstResponder];
    
    [UIView transitionWithView:view_container
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromRight
                    animations: ^{
                        
                        view_forgetPassword.hidden = true;
                        view_login.hidden = false;
                    }
     
                    completion:^(BOOL finished) {
                        
                        lbl_title.text = @"login";
                        
                    }];
    
}

- (IBAction)btnResetPassword_action:(id)sender {
    
    
    if (tf_forgetPassword.text.length == 0) {
        
        [Utility shakeView:view_container]; [self changeColorOnIncompleteFields:false];
        
        return;
        
    }
    
    lbl_title.text = @"login";
    
}

- (IBAction)btnCleatTextField_action:(id)sender {
    
    if ([tf_email isFirstResponder] || tf_email.text.length > 0) {
        
        tf_email.text           = nil;
        btnClear1.hidden = img_email_ok_1.hidden = true;
        
    } else {
        
        tf_forgetPassword.text  = nil;
        btnClear2.hidden = img_email_ok_2.hidden = true;
        
    }
    
}

@end
