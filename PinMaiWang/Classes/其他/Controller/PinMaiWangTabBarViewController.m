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

- (UINavigationController *)navControllerWithClass:(NSString *)clsName Title:(NSString *)title NormalImage:(NSString *)normalImg HighlightedImage:(NSString *)highlightedImg {
    
    UIImage *norImg = [UIImage imageNamed:normalImg];
    UIImage *selImg = [UIImage imageNamed:highlightedImg];
    
    __kindof UIViewController *vc = [[NSClassFromString(clsName) alloc] init];
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = norImg;
    vc.tabBarItem.selectedImage = selImg;
    vc.title = title;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    return nav;
}

-(void)setUpControllers{
    
    [self.tabBar setTintColor:PM_HOME_TOP_COLOR];

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
    NSMutableArray<UINavigationController *> *navs = [NSMutableArray array];
    for (int i = 0; i < count; i++) {
        
        NSString *title = [NSString stringWithUTF8String:tabBarStructs[i].title];
        NSString *norImage = [NSString stringWithUTF8String:tabBarStructs[i].norImage];
        NSString *selImage = [NSString stringWithUTF8String:tabBarStructs[i].selImage];
        NSString *vcClass  = [NSString stringWithUTF8String:tabBarStructs[i].vcClassName];
        
        UINavigationController *nav = [self navControllerWithClass:vcClass Title:title NormalImage:norImage HighlightedImage:selImage];
        [navs addObject:nav];
    }
    
    self.viewControllers = navs;
    navs = nil;
    
}


@end
