

#import "UserInfo.h"

#define kUserInfo           @"userinfo"
#define kFirstName          @"firstName"
#define kLastName           @"lastName"
#define kEmailAddress       @"emailAddress"
#define kPassword           @"password"
#define kPhoneNo            @"phoneNo"
#define kFacebooID          @"facebookId"
#define kGooglePlusID       @"googlePlusId"
#define kUserID             @"userID"
#define kimgProfileURL      @"imgProfileURL"
#define kThumbnailImage     @"imgThumbURL"
#define kimgSocialURL       @"imgSocialURL"

#define kOccupation         @"occupation"
#define kDateOfBirth        @"dateOfBirth"
#define kNationality        @"nationality"
#define kLanguage           @"language"
#define kLocation           @"location"
#define kAboutMe            @"aboutMe"
#define kFullName           @"fullName"
#define kGender             @"gender"
#define kMemberSince        @"memberSince"

#define kIsLogin            @"isLogin"
#define kIsChatON           @"isChatON"
#define kIsSoundON          @"isSoundON"
#define kIsNotificationON   @"isNotificationON"

// Prefered contact
#define kIsPhone            @"is_Phone"
#define kIsEmail            @"is_Email"
#define kIsChating          @"is_Chating"

#define kArrSkills          @"arr_skills"

static UserInfo *singletonInstance;

@implementation UserInfo

- (id) init {
    
    if (self = [super init]) {
        
    }
    
    self.isLogin    = NO;
    self.arrSkills  = nil;
    
    return self;
}

#pragma mark - Shared Instance
+ (UserInfo*)instance {
    
    if(!singletonInstance) {
        
        singletonInstance=[[UserInfo alloc]init];
        
        [singletonInstance loadUserInfo];
        
    }
    
    return singletonInstance;
}

- (void)copyObject :(UserInfo *) objToCopy {

    singletonInstance.firstName         = objToCopy.firstName;
    singletonInstance.lastName          = objToCopy.lastName;
    singletonInstance.fullName          = objToCopy.fullName;
    singletonInstance.password          = objToCopy.password;
    singletonInstance.emailAddress      = objToCopy.emailAddress;
    singletonInstance.userId            = objToCopy.userId;
    singletonInstance.phoneNumber       = objToCopy.phoneNumber;
    singletonInstance.imgProfileURL     = objToCopy.imgProfileURL;
    singletonInstance.imgThumbURL       = objToCopy.imgThumbURL;
    singletonInstance.imgSocialURL      = objToCopy.imgSocialURL;
    singletonInstance.facebokId         = objToCopy.facebokId;
    
    singletonInstance.occupation        = objToCopy.occupation;
    singletonInstance.dateOfBirth       = objToCopy.dateOfBirth;
    singletonInstance.nationality       = objToCopy.nationality;
    
    singletonInstance.language          = objToCopy.language;
    singletonInstance.aboutMe           = objToCopy.aboutMe;
    singletonInstance.location          = objToCopy.location;
    singletonInstance.gender            = objToCopy.gender;
    singletonInstance.memberSince       = objToCopy.memberSince;
    
    singletonInstance.isLogin           = objToCopy.isLogin;
    singletonInstance.isChatOn          = objToCopy.isChatOn;
    singletonInstance.isSoundOn         = objToCopy.isSoundOn;
    singletonInstance.isNotificationOn  = objToCopy.isNotificationOn;
    
    singletonInstance.isPhone           = objToCopy.isPhone;
    singletonInstance.isEmail           = objToCopy.isEmail;
    singletonInstance.isChating         = objToCopy.isChating;
    
    singletonInstance.arrSkills         = objToCopy.arrSkills;
    
}

#pragma mark - Encode Decoder
- (void)encodeWithCoder:(NSCoder *)encoder {

    [encoder encodeObject       :[self firstName]           forKey:kFirstName];
    [encoder encodeObject       :[self facebokId]           forKey:kFacebooID];
    [encoder encodeObject       :[self lastName]            forKey:kLastName];
    [encoder encodeObject       :[self fullName]            forKey:kFullName];
    [encoder encodeObject       :[self password]            forKey:kPassword];
    
    [encoder encodeObject       :[self imgProfileURL]    forKey:kimgProfileURL];
    [encoder encodeObject       :[self imgSocialURL]     forKey:kimgSocialURL];
    [encoder encodeObject       :[self imgThumbURL]      forKey:kThumbnailImage];
    
    [encoder encodeObject       :[self emailAddress]        forKey:kEmailAddress];
    [encoder encodeObject       :[self userId]              forKey:kUserID];
    [encoder encodeObject       :[self phoneNumber]         forKey:kPhoneNo];
    
    [encoder encodeObject       :[self occupation]          forKey:kOccupation];
    [encoder encodeObject       :[self dateOfBirth]         forKey:kDateOfBirth];
    [encoder encodeObject       :[self nationality]         forKey:kNationality];
    
    [encoder encodeObject       :[self language]            forKey:kLanguage];
    [encoder encodeObject       :[self aboutMe]             forKey:kAboutMe];
    [encoder encodeObject       :[self location]            forKey:kLocation];
    [encoder encodeObject       :[self gender]              forKey:kGender];
    [encoder encodeObject       :[self memberSince]         forKey:kMemberSince];
    
    [encoder encodeBool         :[self isLogin]             forKey:kIsLogin];
    [encoder encodeBool         :[self isChatOn]            forKey:kIsChatON];
    [encoder encodeBool         :[self isSoundOn]           forKey:kIsSoundON];
    [encoder encodeBool         :[self isNotificationOn]    forKey:kIsNotificationON];
    
    [encoder encodeBool         :[self isPhone]             forKey:kIsPhone];
    [encoder encodeBool         :[self isEmail]             forKey:kIsEmail];
    [encoder encodeBool         :[self isChating]           forKey:kIsChating];
    
    [encoder encodeObject       :[self arrSkills]           forKey:kArrSkills];
    
}

- (id)initWithCoder:(NSCoder *)decoder {
    
    if((self = [super init])) {
        
        self.firstName          = [decoder decodeObjectForKey:kFirstName];
        self.lastName           = [decoder decodeObjectForKey:kLastName];
        self.fullName           = [decoder decodeObjectForKey:kFullName];
        self.password           = [decoder decodeObjectForKey:kPassword];
        self.facebokId          = [decoder decodeObjectForKey:kFacebooID];
        self.emailAddress       = [decoder decodeObjectForKey:kEmailAddress];
        self.imgProfileURL      = [decoder decodeObjectForKey:kimgProfileURL];
        self.imgThumbURL        = [decoder decodeObjectForKey:kThumbnailImage];
        self.imgSocialURL       = [decoder decodeObjectForKey:kimgSocialURL];
        self.userId             = [decoder decodeObjectForKey:kUserID];
        self.phoneNumber        = [decoder decodeObjectForKey:kPhoneNo];
        
        self.occupation         = [decoder decodeObjectForKey:kOccupation];
        self.dateOfBirth        = [decoder decodeObjectForKey:kDateOfBirth];
        self.nationality        = [decoder decodeObjectForKey:kNationality];
        
        self.language           = [decoder decodeObjectForKey:kLanguage];
        self.aboutMe            = [decoder decodeObjectForKey:kAboutMe];
        self.location           = [decoder decodeObjectForKey:kLocation];
        self.gender             = [decoder decodeObjectForKey:kGender];
        self.memberSince        = [decoder decodeObjectForKey:kMemberSince];
        
        self.isLogin            = [decoder decodeBoolForKey:kIsLogin];
        self.isChatOn           = [decoder decodeBoolForKey:kIsChatON];
        self.isSoundOn          = [decoder decodeBoolForKey:kIsSoundON];
        self.isNotificationOn   = [decoder decodeBoolForKey:kIsNotificationON];
        
        self.isPhone            = [decoder decodeBoolForKey:kIsPhone];
        self.isEmail            = [decoder decodeBoolForKey:kIsEmail];
        self.isChating          = [decoder decodeBoolForKey:kIsChating];
        
        self.arrSkills          = [decoder decodeObjectForKey:kArrSkills];
        
    }
    return self;
}

#pragma mark - Custom Methods

- (void)loadUserInfo {
    
	NSUserDefaults *defaults    = [NSUserDefaults standardUserDefaults];
    
    NSData *myEncodedObject     = [defaults objectForKey:kUserInfo];
    
	[defaults                   synchronize];
    
    UserInfo *obj               = (UserInfo *)[NSKeyedUnarchiver unarchiveObjectWithData: myEncodedObject];
    
	if (obj) {
        
		[self copyObject:obj];
        
	}
}

- (void)saveUserInfo {
    
	NSData *myEncodedObject     = [NSKeyedArchiver archivedDataWithRootObject:singletonInstance];
    
    NSUserDefaults *defaults    = [NSUserDefaults standardUserDefaults];
    
    [defaults                   setObject:myEncodedObject forKey:kUserInfo];
    
    [defaults                   synchronize];
}

- (void)setUserWithInfo:(NSDictionary *)userDict{
    
    self.firstName              = [userDict valueForKey:kFirstName];
    self.lastName               = [userDict valueForKey:kLastName];
    self.fullName               = [userDict valueForKey:kFullName];
    self.emailAddress           = [userDict valueForKey:kEmailAddress];
    self.password               = [userDict valueForKey:kPassword];
    self.facebokId              = [userDict valueForKey:kFacebooID];
    self.phoneNumber            = [userDict valueForKey:kPhoneNo];
    self.userId                 = [userDict valueForKey:kUserID];
    self.imgProfileURL          = [userDict valueForKey:kimgProfileURL];
    self.imgThumbURL            = [userDict valueForKey:kThumbnailImage];
    self.imgSocialURL           = [userDict valueForKey:kimgSocialURL];
    
    self.occupation             = [userDict valueForKey:kOccupation];
    self.dateOfBirth            = [userDict valueForKey:kDateOfBirth];
    self.nationality            = [userDict valueForKey:kNationality];
    
    self.language               = [userDict valueForKey:kLanguage];
    self.aboutMe                = [userDict valueForKey:kAboutMe];
    self.location               = [userDict valueForKey:kLocation];
    self.gender                 = [userDict valueForKey:kGender];
    self.memberSince            = [userDict valueForKey:kMemberSince];
    
    self.isLogin                = [[userDict valueForKey:kIsLogin] boolValue];
    self.isChatOn               = [[userDict valueForKey:kIsChatON] boolValue];
    self.isSoundOn              = [[userDict valueForKey:kIsSoundON] boolValue];
    self.isNotificationOn       = [[userDict valueForKey:kIsNotificationON] boolValue];
    
    self.isPhone                = [[userDict valueForKey:kIsPhone] boolValue];
    self.isEmail                = [[userDict valueForKey:kIsEmail] boolValue];
    self.isChating              = [[userDict valueForKey:kIsChating] boolValue];
    
    self.arrSkills              = [userDict valueForKey:kArrSkills];
    
}


- (void)removeUserInfo {
    
    self.isLogin                = false;
    self.isChatOn               = false;
    self.isSoundOn              = false;
    self.isNotificationOn       = false;
    
    self.isPhone                = false;
    self.isEmail                = false;
    self.isChating              = false;
    
    self.firstName              = @"";
    self.lastName               = @"";
    self.fullName               = @"";
    self.emailAddress           = @"";
    self.facebokId              = @"";
    self.password               = @"";
    self.phoneNumber            = @"";
    self.userId                 = @"";
    self.imgProfileURL          = @"";
    self.imgThumbURL            = @"";
    self.imgSocialURL           = @"";
    
    self.occupation             = @"";
    self.dateOfBirth            = @"";
    self.nationality            = @"";
    self.location               = @"";
    
    self.language               = @"";
    self.aboutMe                = @"";
    self.gender                 = @"";
    self.memberSince            = @"";
    
    self.arrSkills              = nil;
}

@end
