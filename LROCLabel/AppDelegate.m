//
//  AppDelegate.m
//  LROCLabel
//
//  Created by dalizi on 2018/12/24.
//  Copyright © 2018年 dalizi. All rights reserved.
//

#import "AppDelegate.h"
#import "LRTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window makeKeyAndVisible];
    UINavigationController *root = [[UINavigationController alloc] initWithRootViewController:[[LRTableViewController alloc] init]];
    self.window.rootViewController = root;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application { }

- (void)applicationDidEnterBackground:(UIApplication *)application { }

- (void)applicationWillEnterForeground:(UIApplication *)application { }

- (void)applicationDidBecomeActive:(UIApplication *)application { }

- (void)applicationWillTerminate:(UIApplication *)application { }

@end
