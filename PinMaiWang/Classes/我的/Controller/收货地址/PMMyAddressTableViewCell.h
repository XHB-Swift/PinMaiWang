//
//  PMMyAddressTableViewCell.h
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/28.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMMyAddressTableViewCell : UITableViewCell

@property (nonatomic,strong) NSDictionary * dict;
@property (nonatomic,strong) UILabel * name;
@property (nonatomic,strong) UILabel * number;
@property (nonatomic,strong) UILabel * address;
@property (nonatomic,strong) UIButton * delecet;
@property (nonatomic,strong) UIButton * btn;

@end
