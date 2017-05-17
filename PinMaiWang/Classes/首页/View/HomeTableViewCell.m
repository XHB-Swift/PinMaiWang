//
//  HomeTableViewCell.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "HomeTableViewCell.h"

@interface HomeTableViewCell ()
// 产品图片
@property (nonatomic,strong) UIImageView * iconView;
// 产品标题
@property (nonatomic,strong) UILabel * title;
// 产地
@property (nonatomic,strong) UIImageView * placeView;
// 规格
@property (nonatomic,strong) UILabel * size;
// 单价
@property (nonatomic,strong) UILabel * price;
// 总价
@property (nonatomic,strong) UILabel * totalPrice;
// 销售量
@property (nonatomic,strong) UILabel * number;
@end

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.iconView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
        self.iconView.image = [UIImage imageNamed:@"order_01"];
        [self.contentView addSubview:self.iconView];
        
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(self.iconView.maxX+10, 10, XHB_SCREEN_WIDTH-self.iconView.width-10 - 40, 30)];
        self.title.numberOfLines = 0;
        self.title.text = @"吉利乔治 法国生蚝";
        self.title.font = [UIFont systemFontOfSize:14.0];
        //        self.title.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.title];
        
        self.placeView = [[UIImageView alloc]initWithFrame:CGRectMake(self.title.maxX+5, 5, 20, 20)];
        self.placeView.image = [UIImage resizeImage:[UIImage imageNamed:@"index_06"] toNewSize:CGSizeMake(20, 20)];
        [self.contentView addSubview:self.placeView];
        
        
        self.size = [[UILabel alloc]initWithFrame:CGRectMake(self.title.x, self.title.maxY+5, XHB_SCREEN_WIDTH/2, 20)];
        self.size.font = [UIFont systemFontOfSize:13.0];
        //        self.size.backgroundColor = [UIColor yellowColor];
        self.size.text = @"8.5千克/盒子";
        [self.contentView addSubview:self.size];
        
        
        self.price = [[UILabel alloc]initWithFrame:CGRectMake(self.size.x, self.size.maxY+5, XHB_SCREEN_WIDTH/2, self.size.height)];
        self.price.font = [UIFont systemFontOfSize:12.0];
        self.price.text = @"¥25.33起/500克";
        self.price.textColor = [UIColor redColor];
        //        self.price.backgroundColor = [UIColor blueColor];
        [self.contentView addSubview:self.price];
        
        self.totalPrice = [[UILabel alloc]initWithFrame:CGRectMake(self.price.x, self.price.maxY+5, XHB_SCREEN_WIDTH/3.5, self.price.height)];
        self.totalPrice.font = [UIFont systemFontOfSize:11.0];
        self.totalPrice.text = @"¥9999/箱";
        self.totalPrice.textColor = [UIColor redColor];
        //        self.totalPrice.backgroundColor = [UIColor purpleColor];
        [self.contentView addSubview:self.totalPrice];
        
        
        self.number = [[UILabel alloc]initWithFrame:CGRectMake(self.totalPrice.maxX+10, self.price.maxY+5, XHB_SCREEN_WIDTH-self.totalPrice.width-self.iconView.width-40, self.totalPrice.height)];
        self.number.font = [UIFont systemFontOfSize:11.0];
        self.number.text = @"已售999999箱";
        //        self.number.backgroundColor = [UIColor cyanColor];
        [self.contentView addSubview:self.number];
    }
    return self;
}



@end
