//
//  PinMaiWangTabBarViewController.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/15.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PinMaiWangTabBarViewController.h"
#import "ViewController.h"
#import "MineViewController.h"
#import "AuctionViewController.h"
#import "CategoryViewController.h"
#import "CartViewController.h"

@interface PinMaiWangTabBarViewController ()

@end

@implementation PinMaiWangTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpControllers];
}

- (void)setUpOneChildController:(UINavigationController *)controller Title:(NSString *)title Image:(NSString *)image SelectedImage:(NSString *)selectedimage{
    
    CGSize imgSize = CGSizeMake(25, 25);
    
    UIImage *norImg = [[[UIImage imageNamed:image] resizeImageToSize:imgSize] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selImg = [[[UIImage imageNamed:selectedimage] resizeImageToSize:imgSize] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    controller.tabBarItem.title = title;
    controller.tabBarItem.image = norImg;
    controller.tabBarItem.selectedImage = selImg;//[[UIImage resizeImage:[UIImage imageNamed:selectedimage] toNewSize:CGSizeMake(20, 20)]imageWithRenderingMode:UIImageRenderingModeAutomatic];
    controller.viewControllers.firstObject.title = title;
    [self addChildViewController:controller];
    
}

-(void)setUpControllers{
    
    typedef struct PMTabBarStruct{
        
        char *title;
        char *norImage;
        char *selImage;
        char *vcClassName;
        
    }PMTabBarStruct;
    
    PMTabBarStruct tabBarStructs[] = {
        {"首页","footer_01","footer_01_1","ViewController"},
        {"分类","footer_02","footer_02_1","CategoryViewController"},
        {"拍卖场","footer_03","footer_03_1","AuctionViewController"},
        {"购物车","footer_04","footer_04_1","CartViewController"},
        {"我的","footer_05","footer_05_1","MineViewController"}};
    
    int count = sizeof(tabBarStructs)/sizeof(PMTabBarStruct);
    for (int i = 0; i < count; i++) {
        
        NSString *title = [NSString stringWithUTF8String:tabBarStructs[i].title];
        NSString *norImage = [NSString stringWithUTF8String:tabBarStructs[i].norImage];
        NSString *selImage = [NSString stringWithUTF8String:tabBarStructs[i].selImage];
        NSString *vcClass  = [NSString stringWithUTF8String:tabBarStructs[i].vcClassName];
        
        __kindof UIViewController *vc = [[NSClassFromString(vcClass) alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        
        [self setUpOneChildController:nav Title:title Image:norImage SelectedImage:selImage];
        
    }
}


@end
