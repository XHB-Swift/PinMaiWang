//
//  LZHTopTitleView.h
//  TopTitleView
//
//  Created by 嚼华先森 on 2017/6/5.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZHTopTitleView : UIView

// title数组
@property (nonatomic,strong) NSArray * titles;

// 父控制器和子控制器数组

-(void)SetUpViewControllerWithFatherVC:(UIViewController *)fatherVC ChildVC:(NSArray<UIViewController *>*)childVC;


@end
