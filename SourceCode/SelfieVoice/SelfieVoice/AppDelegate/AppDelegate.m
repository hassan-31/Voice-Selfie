//
//  AppDelegate.m
//  SelfieVoice
//
//  Created by Muhammad Hassan on 12/11/2015.
//  Copyright © 2015 Hassan. All rights reserved.
//

#import "AppDelegate.h"

#import "Utility.h"

#import <Parse.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [Parse setApplicationId:@"ftFckWX3Abv2VwpYxPO5P5OvBwHSnOnj3UmX0IHY"
                  clientKey:@"h3nZuT5nggC6gYdkTSQ2lBy0NZTk4WceUerzXx1T"];
    
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    
    [[UITabBar appearance] setTintColor:RED_COLOR];
    
    if ([UserInfo instance].isLogin) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        _tbc = [storyboard instantiateViewControllerWithIdentifier:@"TabbarController"];
        
        _tbc.selectedIndex = 0;
        
        self.window.rootViewController = _tbc;
        
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {

    [FBSDKAppEvents activateApp];
    
}

- (void)applicationWillTerminate:(UIApplication *)application {

}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}

@end
