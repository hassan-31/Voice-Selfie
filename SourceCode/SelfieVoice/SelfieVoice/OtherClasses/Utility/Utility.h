
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "User.h"
#import "UserInfo.h"
#import "Constants.h"

#define IS_IPHONE ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)

#define SCREEN_WIDTH (IS_IPHONE ? [UIScreen mainScreen].bounds.size.width : [UIScreen mainScreen].bounds.size.height)
#define SCREEN_HEIGHT (IS_IPHONE ? [UIScreen mainScreen].bounds.size.height : [UIScreen mainScreen].bounds.size.width)
#define IS_IOS7 ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0 ? 20 : 0)

#define INT_TO_STR(number) [NSString stringWithFormat:@"%d",number]
#define FLOAT_TO_STR(number) [NSString stringWithFormat:@"%0.2f",number]
#define ZERO_VALUE 0

#define STATUS_KEY                      @"status"
#define SUCCESS_STATUS                  @"SUCCESS"
#define FAIL_STATUS                     @"FAIL"
#define STATUS_MESSAGE_KEY              @"message"
#define STATUS_MESSAGE                  @"User doesn't exist."
#define OKMessage                       @"OK"
#define LOADING_MESSAGE                 @"Loading..."

#define STOP_MESSAGE                    @"Stop!!!"
#define NO_INTERNET_ACCESS_MESSAGE      @"No Internet Access. Please try later."
#define ERROR_OCCURED_MESSAGE           @"Error occured. Pleaes try later."

#define BTN_WIDTH 68


@interface Utility : NSObject

+ (float)widthOfText:(NSString *)str FontSize:(float)size FontName:(NSString *)fontName;
+ (float)heightOfText:(NSString *)str FontSize:(float)size FontName:(NSString *)fontName;
+ (float)heightOfText:(NSString *)str FontSize:(float)size FontName:(NSString *)fontName Width:(float)width;

+ (BOOL)evaluateEmail:(NSString *)email;

+ (id)getUserDefaultForKey:(NSString *)key;
+ (void)setUserDefaultForKey:(NSString *)key Data:(id)data;

+ (void)setForKey:(NSString *)key Value:(NSString *)value;
+ (void)showAlertView:(NSString *)title Message:(NSString *)message OKText:(NSString *)oKText;

+ (NSString *)getForKey:(NSString *)key;

+ (NSString *)getDate;

+ (id)getViewController:(NSString *)viewControllerName;

+ (void)renderViewForResignFirstResponder:(UIView *)viewToRender;

+ (NSString *)getDeviceResolution;
+ (NSString *)getDeviceImageNotation;

+ (float)getScreenWidth;
+ (float)getScreenHeight;
+ (float)getPercentageOfScreenWidth:(float)percentage;
+ (float)getPercentageOfScreenHeight:(float)percentage;

// load nib
+ (id)loadNib:(NSString *)nibName;

+ (void)setImageBounds:(UIImageView *)imageView;

// Get Profile image URL
+ (NSURL *)getProfileImageURL;

// Get Clinet Profile image URL
+ (NSURL *)getClinetProfileImageURL:(User *)user;

// Get user info
+ (User *)getUserObjectToUpdate;

// Cross Dissolve Animation on UIviewController
+ (CATransition *)setAnimationLayer;

// Navigationbar shaddow line color
+ (void)setNavigationBarShaddowLineColor:(UINavigationController *)navigationController withColor:(UIColor *)color;

#pragma mark - Wizard view
+ (void)addWizardView:(UINavigationController *)navController;

// Third party Tabbar Controller
+ (void)setupTabBarController:(UIWindow *)window;

// Shake View with vibration
+ (void)shakeView:(UIView *)view;

// Activity
+ (void)showActivity;
+ (void)dismissActivity;

@end
