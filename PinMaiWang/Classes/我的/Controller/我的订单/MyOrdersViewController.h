//
//  MyOrdersViewController.h
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/6/5.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MyOrderStatus){
    
    MyOrderStatusAll,        //全部
    MyOrderStatusNotPay,     //待付款
    MyOrderStatusNotDeliver, //待发货
    MyOrderStatusNotRecieve, //待收货
    MyOrderStatusNotComment, //待评论
    MyOrderStatusHasCancel   //已取消
    
};

@interface MyOrdersViewController : UIViewController

- (instancetype)initWithOrderStatus:(MyOrderStatus)status;



@end
