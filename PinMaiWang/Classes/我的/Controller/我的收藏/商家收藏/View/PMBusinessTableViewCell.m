//
//  PMBusinessTableViewCell.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/25.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMBusinessTableViewCell.h"

@interface PMBusinessTableViewCell ()
// 供应商
@property (nonatomic,strong) UILabel * suppliers;
// 所在地
@property (nonatomic,strong) UILabel * address;


@end

@implementation PMBusinessTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.suppliers = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, XHB_SCREEN_WIDTH/3, 30)];
        self.suppliers.textAlignment = NSTextAlignmentCenter;
        self.suppliers.font = [UIFont systemFontOfSize:14.0];
        [self addSubview:self.suppliers];
        
        self.address = [[UILabel alloc]initWithFrame:CGRectMake(self.suppliers.maxX, self.suppliers.y, self.suppliers.width, self.suppliers.height)];
        self.address.font = [UIFont systemFontOfSize:15.0];
        self.address.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.address];
        
        UIButton *cance = [UIButton buttonWithType:UIButtonTypeSystem];
        cance.frame = CGRectMake(self.address.maxX, self.address.y, self.address.width, self.address.height);
        [cance setTitle:@"取消关注" forState:UIControlStateNormal];
        cance.tag = 10086;
        [cance addTarget:self action:@selector(canceAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cance];
        
    }
    return self;
}

-(void)setDictionary:(NSDictionary *)dictionary{
    
    _dictionary = dictionary;
    if (dictionary[@"title"] && dictionary[@"origin"]) {
        self.suppliers.text = dictionary[@"title"];
        self.address.text = dictionary[@"origin"];
    }
}

-(void)canceAction:(UIButton *)sender{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"CanceNotificationName" object:nil userInfo:@{@"Value":@(sender.tag)}];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
