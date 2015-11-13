
#import "Utility.h"

#import "AppDelegate.h"

#import <SVProgressHUD.h>

#import <UIView+Shake.h>
#import <AudioToolbox/AudioToolbox.h>

static NSString *deviceToken;
//static JFMinimalNotification *minimalNotification;

@implementation Utility

+ (float)heightOfText:(NSString *)str FontSize:(float)size FontName:(NSString *)fontName {
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 270, 65)];
    [textView setText:str];
    
    [textView setFont:[UIFont fontWithName:fontName size:size + 0.5]];
    return [textView sizeThatFits:textView.frame.size].height;
}

+ (float)widthOfText:(NSString *)str FontSize:(float)size FontName:(NSString *)fontName {
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, 300, 65)];
    [textView setText:str];
    
    [textView setFont:[UIFont fontWithName:fontName size:size + 0.5]];
    [textView setFrame:CGRectMake(0, 0, 280, [textView sizeThatFits:textView.frame.size].height)];
    return [textView sizeThatFits:textView.frame.size].width;
}

+ (float)heightOfText:(NSString *)str FontSize:(float)size FontName:(NSString *)fontName Width:(float)width {
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, width, 65)];
    [textView setText:str];
    
    [textView setFont:[UIFont fontWithName:fontName size:size + 0.5]];
    [textView setFrame:CGRectMake(0, 0, width, [textView sizeThatFits:textView.frame.size].height)];
    return [textView sizeThatFits:textView.frame.size].height;
}

+ (void)initialize {
    
    deviceToken = @"";
}

+ (BOOL)evaluateEmail:(NSString *)email {
    
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

+ (void)showAlertView:(NSString *)title Message:(NSString *)message OKText:(NSString *)oKText {

    dispatch_async(dispatch_get_main_queue(), ^(void) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:oKText otherButtonTitles: nil];
        [alertView show];
    });
}

+ (id)getUserDefaultForKey:(NSString *)key {
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    return [userDefault objectForKey:key];
}

+ (void)setUserDefaultForKey:(NSString *)key Data:(id)data {
    
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:data forKey:key];
    [userDefault synchronize];
}

+ (void)setForKey:(NSString *)key Value:(NSString *)value {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}

+ (NSString *)getForKey:(NSString *)key {
    
    NSUserDefaults *userDefauls = [NSUserDefaults standardUserDefaults];
    return [userDefauls objectForKey:key];
}

+ (NSString *)getDate {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy/MM/dd hh:mm"];
    return [dateFormat stringFromDate:[NSDate date]];
}

+ (id)getViewController:(NSString *)viewControllerName {
    
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    return [storyBoard instantiateViewControllerWithIdentifier:viewControllerName];
}

+ (NSDictionary*)parseURLParams:(NSString *)query {
    
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    for (NSString *pair in pairs) {
        NSArray *kv = [pair componentsSeparatedByString:@"="];
        
        NSString *val = [kv[1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        params[kv[0]] = val;
    }
    
    return params;
}

+ (void)renderViewForResignFirstResponder:(UIView *)viewToRender {
    for (UIView *viewOBJTemp in viewToRender.subviews) {
        
        if ([viewOBJTemp isKindOfClass:[UITextView class]])
            [((UITextView *)viewOBJTemp) resignFirstResponder];
        else if ([viewOBJTemp isKindOfClass:[UITextField class]])
            [((UITextField *)viewOBJTemp) resignFirstResponder];
        
        [self renderViewForResignFirstResponder:viewOBJTemp];
    }
}

+ (NSString *)getDeviceResolution {
    
    NSString *strDevice = @"";
    
    if (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) {
        
        strDevice = @"retina1";
        
    } else if(IS_IPHONE_6 || IS_IPHONE_6P) {
        
        strDevice = @"retina2";
        
    }
    
    return strDevice;
    
}

+ (NSString *)getDeviceImageNotation {

    NSString *strDevice = @"";
    
    if (IS_IPHONE_5) {
        
        strDevice = @"-568h@2x";
        
    } else if(IS_IPHONE_6) {
        
        strDevice = @"@3x";
        
    } else if(IS_IPHONE_6P) {
        
        strDevice = @"-736h@3x";
        
    }
    
    return strDevice;

}

+ (float)getScreenWidth {
    
    return [UIScreen mainScreen].bounds.size.width;
    
}

+ (float)getScreenHeight {
    
    return [UIScreen mainScreen].bounds.size.height;
    
}

+ (float)getPercentageOfScreenWidth:(float)percentage {
    
    return ( percentage / 100 ) * [Utility getScreenWidth];
    
}

+ (float)getPercentageOfScreenHeight:(float)percentage {
    
    return ( percentage / 100 ) * [Utility getScreenHeight];
    
}

// load nib
+ (id)loadNib:(NSString *)nibName {
    
    NSArray *nibObjects = [[NSBundle mainBundle] loadNibNamed:nibName owner:self options:nil];
    
    return [nibObjects firstObject];
    
}

+ (void)setImageBounds:(UIImageView *)imageView {
    
    imageView.layer.cornerRadius        = roundf(imageView.frame.size.width/2.0f);
    imageView.clipsToBounds             = true;
    imageView.layer.masksToBounds       = true;
    
}

// Get Profile image URL
+ (NSURL *)getProfileImageURL {
    
    if ([UserInfo instance].imgProfileURL.length > 0) {
        
        return [NSURL URLWithString:[UserInfo instance].imgProfileURL];
        
    } else if ([UserInfo instance].imgSocialURL.length > 0) {
        
        return [NSURL URLWithString:[UserInfo instance].imgSocialURL];
        
    } else {
        
        return [NSURL URLWithString:[UserInfo instance].imgThumbURL];
        
    }

}

// Get Clinet Profile image URL
+ (NSURL *)getClinetProfileImageURL:(User *)user {
    
    if (user.imgProfileURL.length > 0) {
        
        return [NSURL URLWithString:user.imgProfileURL];
        
    } else if (user.imgSocialURL.length > 0) {
        
        return [NSURL URLWithString:user.imgSocialURL];
        
    } else {
        
        return [NSURL URLWithString:user.imgThumbURL];
        
    }
    
}

+ (User *)getUserObjectToUpdate {
    
    User *userOBJ           = [[User alloc] init];
    
    userOBJ.userId          = [UserInfo instance].userId;
    
    userOBJ.fullName        = [UserInfo instance].fullName;
    
    NSArray *arrName        = [userOBJ.fullName componentsSeparatedByString:@" "];
    
    if (arrName.count > 1) {
        
        userOBJ.firstName   = [arrName objectAtIndex:0];
        userOBJ.lastName    = [arrName objectAtIndex:1];
        
    } else {
        
        userOBJ.firstName   = [arrName objectAtIndex:0];
        userOBJ.lastName    = @"";
    }
    
    // Private details
    userOBJ.gender          = [UserInfo instance].gender;
    userOBJ.dateOfBirth     = [UserInfo instance].dateOfBirth;
    userOBJ.emailAddress    = [UserInfo instance].emailAddress;
    userOBJ.phoneNumber     = [UserInfo instance].phoneNumber;
    
    // Optional details
    userOBJ.location        = [UserInfo instance].location;
    userOBJ.occupation      = [UserInfo instance].occupation;
    userOBJ.nationality     = [UserInfo instance].nationality;
    userOBJ.language        = [UserInfo instance].language;
    
    // About me description
    userOBJ.aboutMe         = [UserInfo instance].aboutMe;
    
    return userOBJ;
}

// Cross Dissolve Animation Layer
+ (CATransition *)setAnimationLayer {
    
    CATransition *transition    = [CATransition animation];
    transition.duration         = 0.3;
    transition.type             = kCATransitionFade;
    transition.subtype          = kCATransitionFromTop;
    
    return transition;
}

// Navigationbar shaddow line color
+ (void)setNavigationBarShaddowLineColor:(UINavigationController *)navigationController withColor:(UIColor *)color {
    
    CGRect frame = navigationController.navigationBar.frame;
    
    CALayer *bottomBorder = [CALayer layer];
    bottomBorder.frame = CGRectMake(0.0f, frame.size.height, frame.size.width, 0.5f);
    bottomBorder.backgroundColor = [color CGColor];
    
    // Add the later to the tab bar's existing layer
    [navigationController.navigationBar.layer addSublayer:bottomBorder];
    
}

#pragma mark - Wizard view
+ (void)addWizardView:(UINavigationController *)navController {

    UIView          *wizardView;
    
    UIImageView     *img01;
    UIImageView     *img02;
    UIImageView     *img03;
    
    float width     = [Utility getPercentageOfScreenWidth:33.12f];
    
    wizardView      = [[UIView alloc] initWithFrame:CGRectMake(0, 40, [Utility getScreenWidth], 4)];
    wizardView.tag  = 121;
    
    img01           = [[UIImageView alloc] init];
    img01.frame     = CGRectMake(0, 0, width, 4);
    img01.tag       = 111;
    [wizardView     addSubview:img01];
    
    img02           = [[UIImageView alloc] init];
    img02.frame  	= CGRectMake((CGRectGetMaxX(img01.frame) + 1), 0, width, 4);
    img02.tag       = 222;
    [wizardView     addSubview:img02];
    
    img03           = [[UIImageView alloc] init];
    img03.frame     = CGRectMake((CGRectGetMaxX(img02.frame) + 1), 0, width, 4);
    img03.tag       = 333;
    [wizardView     addSubview:img03];
    
    [navController.navigationBar addSubview:wizardView];

}

// Third party Tabbar Controller
+ (void)setupTabBarController:(UIWindow *)window {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UITabBarController *tabBarController = [storyboard instantiateViewControllerWithIdentifier:@"TabbarController"];
    
    tabBarController.view.backgroundColor = [UIColor whiteColor];
    
    ((AppDelegate *)[UIApplication sharedApplication].delegate).tbc = tabBarController;
    
    tabBarController.selectedIndex = 0;
    
    [UIView transitionWithView:window
                      duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        
                        window.rootViewController   = tabBarController;
                    }
                    completion:nil];
    
}

// Shake View with vibration
+ (void)shakeView:(UIView *)view {
    
    [view shake:6   // 6 times
                withDelta:5    // 5 points wide
                    speed:0.05 // 30ms per shake
           shakeDirection:ShakeDirectionHorizontal
     ];
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
}

+ (void)showActivity {
    
    [SVProgressHUD setRingThickness:5.0];
    [SVProgressHUD setBackgroundColor:[UIColor clearColor]];
    
    [SVProgressHUD show];
    
}

+ (void)dismissActivity {
    
    [SVProgressHUD dismiss];
    
}

@end
