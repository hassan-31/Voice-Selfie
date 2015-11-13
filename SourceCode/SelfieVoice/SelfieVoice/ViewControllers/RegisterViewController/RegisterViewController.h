//
//  RegisterViewController.h
//  SelfieVoice
//
//  Created by Muhammad Hassan on 13/11/2015.
//  Copyright © 2015 Hassan. All rights reserved.
//

#import <UIKit/UIKit.h>

// Base Class
#import "BaseViewController.h"

@interface RegisterViewController : BaseViewController {
    
    IBOutlet UITextField    *tf_firstName;
    IBOutlet UITextField    *tf_lastName;
    IBOutlet UITextField    *tf_email;
    IBOutlet UITextField    *tf_password;
    IBOutlet UITextField    *tf_phone;
    
    IBOutlet UILabel        *lblTitle;
    
    IBOutlet UIImageView    *img_email_ok;
    IBOutlet UIImageView    *view_register;
    IBOutlet UIView         *view_register_form;
    
    BOOL                    isPlaceholderColorChanged;
    
}

- (IBAction)btnDismiss_action:(id)sender;
- (IBAction)btnRegister_action:(id)sender;

- (IBAction)textDidChange_action:(UITextField *)sender;

@end
