//
//  PMProductTableViewCell.h
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/6/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PMProductModel.h"

@interface PMProductTableViewCell : UITableViewCell
@property (nonatomic,strong) PMProductModel * model;
@property (nonatomic,strong) UIImageView * imgView;

@property (nonatomic,strong) UIImageView * place;
@property (nonatomic,strong) UILabel * title;

@property (nonatomic,strong) UILabel * size;
@property (nonatomic,strong) UILabel * price;

@property (nonatomic,strong) UILabel * total;
// 已售
@property (nonatomic,strong) UILabel * sold;

// 售罄
@property (nonatomic,strong) UILabel * sellUp;

@end
