//
//  ViewController.h
//  SelfieVoice
//
//  Created by Muhammad Hassan on 12/11/2015.
//  Copyright © 2015 Hassan. All rights reserved.
//

#import <UIKit/UIKit.h>

// Base Class
#import "BaseViewController.h"

// Regular Classes
#import "RegisterViewController.h"

@interface WelcomeViewController : BaseViewController {
    
    IBOutlet UITextField    *tf_email;
    IBOutlet UITextField    *tf_password;
    IBOutlet UITextField    *tf_forgetPassword;
    
    IBOutlet UIView         *view_login;
    IBOutlet UIView         *view_forgetPassword;
    IBOutlet UIView         *view_email;
    IBOutlet UIView         *view_container;
    
    IBOutlet UIButton       *btnClear1;
    IBOutlet UIButton       *btnClear2;
    
    IBOutlet UIImageView    *bg_login;
    IBOutlet UIImageView    *img_email_ok_1;
    IBOutlet UIImageView    *img_email_ok_2;
    
    IBOutlet UILabel        *lbl_title;
    
}

- (IBAction)btnOpenRegisterView_action:(UIButton *)sender;
- (IBAction)btnFBLogin_action:(UIButton *)sender;

- (IBAction)btnLogin_action:(id)sender;

- (IBAction)textDidChange_action:(UITextField *)sender;

- (IBAction)btnCancel_action:(id)sender;
- (IBAction)btnResetPassword_action:(id)sender;
- (IBAction)btnCleatTextField_action:(id)sender;
- (IBAction)btnForgetPassword_action:(id)sender;

@end

