//
//  PMAppDelegate.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMAppDelegate.h"
#import "PinMaiWangTabBarViewController.h"

@implementation PMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[PinMaiWangTabBarViewController alloc]init];
    [self.window makeKeyAndVisible];
    
    return YES;
}

@end
