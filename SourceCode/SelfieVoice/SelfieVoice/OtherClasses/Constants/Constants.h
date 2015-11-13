#include <UIKit/UIDevice.h>

#import "Utility.h"

//iOS version check
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))

#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)

// enums
typedef enum  {
    InboxVC = 1,
    ArchiveVC = 2
} ChatViewControllerEnum;

// Storyboard ViewControllers Identifiers
#define REGISTER_VIEWCONTROLLER             @"RegisterViewController"
#define WELCOME_VIEWCONTROLLER              @"WelcomeViewController"

//#define PRIMARY_COLOR                       [UIColor colorWithRed:7.0f/255.0f green:186.0f/255.0f blue:234.0f/255.0f alpha:1.0f]

#define PRIMARY_COLOR                       [UIColor colorWithRed:82.0f/255.0f green:151.0f/255.0f blue:221.0f/255.0f alpha:1.0f]

#define SECONDARY_COLOR                     [UIColor colorWithRed:218.0f/255.0f green:80.0f/50.0f blue:66.0f/255.0f alpha:1.0f]

#define BLUE_COLOR                          [UIColor colorWithRed:5.0f/255.0f green:70.0f/255.0f blue:130.0f/255.0f alpha:1.0f]

#define LIGHT_BLUE_COLOR                    [UIColor colorWithRed:80.0f/255.0f green:125.0f/255.0f blue:167.0f/255.0f alpha:1.0f]

#define RED_COLOR                           [UIColor colorWithRed:245.0f/255.0f green:64.0f/255.0f blue:56.0f/255.0f alpha:1.0f]

#define GREEN_COLOR                         [UIColor colorWithRed:31.0f/255.0f green:155.0f/255.0f blue:55.0f/255.0f alpha:1.0f]

#define LIGHT_RED_COLOR                     [UIColor colorWithRed:245.0f/255.0f green:64.0f/255.0f blue:56.0f/255.0f alpha:0.4f]

// UITableView cells
#define MENU_CELL                           @"MenuCell"
#define SKILLS_CELL                         @"SkillsCell"
#define ABOUTME_CELL                        @"AboutMeCell"
#define SETTINGS_CELL                       @"SettingsCell"
#define RATING_CELL                         @"RatingCell"
#define USER_CELL                           @"UserCell"
#define JOB_CELL                            @"JobCell"

//Alert
#define kAlerttitle                         @"Odd Jobs"
#define kMandatoryfields                    @"Please input required fields !!"
#define kInvalidEmail                       @"Please enter valid email format !!"
#define kMatchPasswordMsg                   @"Password did not match with Confirm Password !!"

#define CHANGE_MENU_BUTTON_STATE            @"change_menu_button_state"

// GooglePlus Keys
#define kGPClientID                         @"742086960092-h3aad4ovo9chu34k6qjiq4hpblb85l1q.apps.googleusercontent.com"

// Google Places Api Key
#define kGoogleAPIKey                  @"AIzaSyA2_J3j9p1exB5o-mWdh1r9QIMctLncA8o"

#define kBgQueue                            dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

// Profile Screen
#define PROFILE_PLACEHOLDER_TEXT            @"no description available. write few lines about yourself."
#define FRIEND_PROFILE_PLACEHOLDER_TEXT     @"no description available"

#define PROFILE_IMG_PLACEHOLDER             @"profile_placeholder"

// Notifications
#define UPDATE_SKILLS_LIST                  @"update_skills_list"
#define UPDATE_PROFILE                      @"update_profile"


// fonts
#define REGULAR_FONT                        @"GillSans"

// Start Rating
#define kLabelAllowance 50.0f
#define kStarViewHeight 40.0f
#define kStarViewWidth 160.0f
#define kLeftPadding 5.0f



