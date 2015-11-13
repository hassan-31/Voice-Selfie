//
//  RegisterViewController.m
//  SelfieVoice
//
//  Created by Muhammad Hassan on 13/11/2015.
//  Copyright © 2015 Hassan. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@end

@implementation RegisterViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    
    [super viewDidLoad]; [self setupView];
    
}

- (void)viewWillAppear:(BOOL)animated {
    
    [IQKeyboardManager sharedManager].enableAutoToolbar             = true;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside 	= false;
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}

- (void)setupView {
    
    view_register.layer.cornerRadius    = 5.0f;
    
    // Set UITextField left margin
    tf_firstName.leftView               = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 50)];
    tf_firstName.leftViewMode           = UITextFieldViewModeAlways;
    
    tf_lastName.leftView                = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 50)];
    tf_lastName.leftViewMode            = UITextFieldViewModeAlways;
    
    tf_phone.leftView                   = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 50)];
    tf_phone.leftViewMode               = UITextFieldViewModeAlways;
    
    tf_email.leftView                   = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 50)];
    tf_email.leftViewMode               = UITextFieldViewModeAlways;
    
    tf_password.leftView                = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 50)];
    tf_password.leftViewMode            = UITextFieldViewModeAlways;
    
}

#pragma mark - Helper methods
- (void)changeColorOnIncompleteFields {
    
    // Set UITextField placeholder text color white
    if (tf_firstName.text.length == 0) {
        
        isPlaceholderColorChanged           = true;
        
        tf_firstName.attributedPlaceholder  = [[NSAttributedString alloc] initWithString:@"First Name" attributes:@{NSForegroundColorAttributeName: LIGHT_RED_COLOR}];
        
    }
    
    if (tf_lastName.text.length == 0) {
        
        isPlaceholderColorChanged           = true;
        
        tf_lastName.attributedPlaceholder   = [[NSAttributedString alloc] initWithString:@"Last Name" attributes:@{NSForegroundColorAttributeName: LIGHT_RED_COLOR}];
        
    }
    
    if (tf_phone.text.length == 0) {
        
        isPlaceholderColorChanged           = true;
        
        tf_phone.attributedPlaceholder      = [[NSAttributedString alloc] initWithString:@"Phone" attributes:@{NSForegroundColorAttributeName: LIGHT_RED_COLOR}];
        
    }
    
    if (tf_email.text.length == 0) {
        
        isPlaceholderColorChanged           = true;
        
        tf_email.attributedPlaceholder      = [[NSAttributedString alloc] initWithString:@"Email Address" attributes:@{NSForegroundColorAttributeName: LIGHT_RED_COLOR}];
        
    }
    
    if (tf_password.text.length == 0) {
        
        isPlaceholderColorChanged           = true;
        
        tf_password.attributedPlaceholder   = [[NSAttributedString alloc] initWithString:@"Password" attributes:@{NSForegroundColorAttributeName: LIGHT_RED_COLOR}];
        
    }
    
}

#pragma mark - IBaction methods
- (IBAction)btnDismiss_action:(id)sender {
    
    [self.view endEditing:true];
    
    [self.navigationController popViewControllerAnimated:true];
    
}

- (IBAction)btnRegister_action:(id)sender {
    
    if (tf_email.text.length == 0 || tf_firstName.text.length == 0 || tf_lastName.text.length == 0 || tf_phone.text.length == 0 || tf_password.text.length == 0) {
        
        [Utility shakeView:view_register_form]; [self changeColorOnIncompleteFields];
        
        return;
        
    }
    
    User *userOBJ           = [[User alloc] init];
    
    userOBJ.fullName        = [NSString stringWithFormat:@"%@ %@", tf_firstName.text, tf_lastName.text];
    userOBJ.firstName       = tf_firstName.text;
    userOBJ.lastName        = tf_lastName.text;
    userOBJ.password        = tf_password.text;
    userOBJ.emailAddress    = tf_email.text;
    userOBJ.phoneNumber     = tf_phone.text;
    
    [self                   registerNewUser:userOBJ];
    
}

- (IBAction)textDidChange_action:(UITextField *)sender {
    
    if ([sender isEqual:tf_email]) {
        
        [Utility evaluateEmail:sender.text] ? (img_email_ok.hidden = false) : (img_email_ok.hidden = true);
        
    } else {
        
        if (isPlaceholderColorChanged) {
            
            [self changeColorOnIncompleteFields];
            
        }
        
    }
    
}

- (void)registerNewUser:(User *)userOBJ {
    
    PFUser *newUser     = [PFUser user];
    
    [newUser setEmail       :userOBJ.emailAddress];
    [newUser setPassword    :userOBJ.password];
    [newUser setUsername    :userOBJ.fullName];
    
    [newUser setObject      :userOBJ.firstName    forKey:@"firstName"];
    [newUser setObject      :userOBJ.lastName     forKey:@"lastName"];
    [newUser setObject      :userOBJ.fullName     forKey:@"fullName"];
    [newUser setObject      :userOBJ.phoneNumber  forKey:@"phoneNumber"];
    
    [Utility showActivity];
    
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        
        [Utility dismissActivity];
        
        if (!error) {
            
            if (succeeded) {
                
                [UserInfo instance].fullName        = userOBJ.fullName;
                [UserInfo instance].firstName       = userOBJ.firstName;
                [UserInfo instance].lastName        = userOBJ.lastName;
                [UserInfo instance].emailAddress    = userOBJ.emailAddress;
                [UserInfo instance].password        = userOBJ.password;
                [UserInfo instance].password        = userOBJ.password;
                [UserInfo instance].phoneNumber     = userOBJ.phoneNumber;
                
                [UserInfo instance].isLogin         = true;
                
                [[UserInfo instance] saveUserInfo];
                
                [Utility setupTabBarController:[[UIApplication sharedApplication].delegate window]];
                
            }
            
        } else {
            
//            [Utility showAlertView:ALERT_TITLE Message:@"There is an error please try again." OKText:@"OK"];
            
        }
        
    }];
    
}

@end
