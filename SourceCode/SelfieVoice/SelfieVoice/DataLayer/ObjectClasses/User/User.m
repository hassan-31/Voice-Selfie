//
//  User.m
//  ThatDoor
//
//  Created by Lambda Technologies on 30/06/2015.
//  Copyright (c) 2015 Lambda Technologies. All rights reserved.
//

#import "User.h"

@implementation User

- (id)init {
    
    if (self == [super init]) {
        
        self.userId = self.phoneNumber = self.emailAddress = self.firstName = self.lastName = self.password = self.facebookId = self.googlePlusId = self.imgThumbURL = self.imgSocialURL = self.imgProfileURL = self.occupation = self.dateOfBirth = self.nationality = self.lastName = self.aboutMe = self.location = self.fullName = self.gender = self.memberSince = @"";
        
        self.isEdit = self.isChatOn = self.isChating = self.isPhone = self.isEmail = self.isNotificationOn = self.isSoundOn = false;;
        
        self.imgData    = [[NSData alloc] init];
        
    }
    
    return self;
}

@end
