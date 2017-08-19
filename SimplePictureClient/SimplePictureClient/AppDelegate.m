//
//  AppDelegate.m
//  SimplePictureClient
//
//  Created by Catherine Trishina on 15/05/2016.
//  Copyright © 2016 Ekaterina Trishina. All rights reserved.
//

#import "AppDelegate.h"
#import "PictureModuleFactory.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.rootViewController = [PictureModuleFactory createPictureViewController];
    return YES;
}

@end
