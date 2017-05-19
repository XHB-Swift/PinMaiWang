//
//  PMMineHeaderView.h
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

// 以下类型用于通知传值

typedef NSString PMMineHeaderViewMsgType;

// 发送消息
UIKIT_EXTERN PMMineHeaderViewMsgType *const PMMineHeaderViewMsg;
// 登录注册
UIKIT_EXTERN PMMineHeaderViewMsgType *const PMMineHeaderViewMsgLoginReg;
// 头像
UIKIT_EXTERN PMMineHeaderViewMsgType *const PMMineHeaderViewMsgIcon;
// 查看订单
UIKIT_EXTERN PMMineHeaderViewMsgType *const PMMineHeaderViewMsgOrder;
// 待付款
UIKIT_EXTERN PMMineHeaderViewMsgType *const PMMineHeaderViewMsgNotPay;
// 待发货
UIKIT_EXTERN PMMineHeaderViewMsgType *const PMMineHeaderViewMsgNotDeliver;
// 待收货
UIKIT_EXTERN PMMineHeaderViewMsgType *const PMMineHeaderViewMsgNotRecieve;
// 待评价
UIKIT_EXTERN PMMineHeaderViewMsgType *const PMMineHeaderViewMsgNotComment;
// 已取消
UIKIT_EXTERN PMMineHeaderViewMsgType *const PMMineHeaderViewMsgHasCancel;

@interface PMMineHeaderView : UICollectionReusableView

@property (nonatomic, class, readonly) NSString *headerIdentifier;

@end
