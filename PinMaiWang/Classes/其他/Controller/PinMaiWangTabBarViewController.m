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
    
    
    UIImage *norImg = [UIImage imageNamed:image];
    UIImage *selImg = [UIImage imageNamed:selectedimage];
    controller.tabBarItem.title = title;
    controller.tabBarItem.image = norImg;
    controller.tabBarItem.selectedImage = selImg;
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
        {"首页","home_01","home_02","ViewController"},
        {"分类","category_01","category_02","CategoryViewController"},
        {"拍卖场","auction_01","auction_02","AuctionViewController"},
        {"购物车","cart_01","cart_02","CartViewController"},
        {"我的","mine_01","mine_02","MineViewController"}};
    
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
