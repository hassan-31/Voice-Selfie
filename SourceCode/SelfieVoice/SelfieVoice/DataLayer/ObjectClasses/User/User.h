//
//  User.h
//  ThatDoor
//
//  Created by Lambda Technologies on 30/06/2015.
//  Copyright (c) 2015 Lambda Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString  *userId;
@property (nonatomic, strong) NSString  *password;
@property (nonatomic, strong) NSString  *lastName;
@property (nonatomic, strong) NSString  *firstName;
@property (nonatomic, strong) NSString  *fullName;
@property (nonatomic, strong) NSString  *facebookId;
@property (nonatomic, strong) NSString  *phoneNumber;
@property (nonatomic, strong) NSString  *emailAddress;
@property (nonatomic, strong) NSString  *googlePlusId;
@property (nonatomic, strong) NSString  *twitterId;
@property (nonatomic, strong) NSString  *imgThumbURL;
@property (nonatomic, strong) NSString  *imgSocialURL;
@property (nonatomic, strong) NSString  *imgProfileURL;

@property (nonatomic, strong) NSString  *memberSince;

@property (nonatomic, strong) NSString  *dateOfBirth;
@property (nonatomic, strong) NSString  *occupation;
@property (nonatomic, strong) NSString  *location;
@property (nonatomic, strong) NSString  *nationality;

@property (nonatomic, strong) NSString  *language;
@property (nonatomic, strong) NSString  *aboutMe;
@property (nonatomic, strong) NSString  *gender;

@property (nonatomic, strong) NSData    *imgData;

@property (nonatomic, assign) BOOL      isEdit;
@property (nonatomic, assign) BOOL      isChatOn;
@property (nonatomic, assign) BOOL      isSoundOn;
@property (nonatomic, assign) BOOL      isNotificationOn;

// Prefered contact
@property (nonatomic, assign) BOOL isPhone;
@property (nonatomic, assign) BOOL isEmail;
@property (nonatomic, assign) BOOL isChating;

@end
