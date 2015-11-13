
#import <Foundation/Foundation.h>

@interface UserInfo : NSObject

@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;
@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *emailAddress;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *facebokId;
@property (nonatomic, strong) NSString *googlePlusId;
@property (nonatomic, strong) NSString *userId;
@property (nonatomic, strong) NSString *imgThumbURL;
@property (nonatomic, strong) NSString *imgSocialURL;
@property (nonatomic, strong) NSString *imgProfileURL;
@property (nonatomic, strong) NSString *phoneNumber;

@property (nonatomic, strong) NSString *dateOfBirth;
@property (nonatomic, strong) NSString *occupation;
@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *nationality;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *memberSince;

@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *aboutMe;

@property (nonatomic, strong) NSArray  *arrSkills;

@property (nonatomic, assign) BOOL isLogin;
@property (nonatomic, assign) BOOL isChatOn;
@property (nonatomic, assign) BOOL isSoundOn;
@property (nonatomic, assign) BOOL isNotificationOn;

// Prefered contact
@property (nonatomic, assign) BOOL isPhone;
@property (nonatomic, assign) BOOL isEmail;
@property (nonatomic, assign) BOOL isChating;

+ (UserInfo*)instance;

-(void) loadUserInfo;
-(void) saveUserInfo;
-(void) removeUserInfo;

@end
