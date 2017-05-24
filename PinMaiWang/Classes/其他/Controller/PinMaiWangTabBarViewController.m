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
    [self setUpOneChildController:[[UINavigationController alloc]initWithRootViewController:[[ViewController alloc]init]] Title:@"首页" Image:@"footer_01" SelectedImage:@"footer_01_1"];
    [self setUpOneChildController:[[UINavigationController alloc]initWithRootViewController:[[CategoryViewController alloc]init]] Title:@"分类" Image:@"footer_02" SelectedImage:@"footer_02_1"];
    
    [self setUpOneChildController:[[UINavigationController alloc]initWithRootViewController:[[AuctionViewController alloc]init]] Title:@"拍卖场" Image:@"footer_03" SelectedImage:@"footer_03_1"];
    
    [self setUpOneChildController:[[UINavigationController alloc]initWithRootViewController:[[CartViewController alloc]init]] Title:@"购物车" Image:@"footer_04" SelectedImage:@"footer_04_1"];
     [self setUpOneChildController:[[UINavigationController alloc]initWithRootViewController:[[MineViewController alloc]init]] Title:@"我的" Image:@"footer_05" SelectedImage:@"footer_05_1"];
}


@end
