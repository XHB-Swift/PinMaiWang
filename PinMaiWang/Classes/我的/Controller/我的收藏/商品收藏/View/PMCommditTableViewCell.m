//
//  PMCommditTableViewCell.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/25.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMCommditTableViewCell.h"

@interface PMCommditTableViewCell   ()
// 配图
@property (nonatomic,strong) UIImageView * iconimgView;
// 标题
@property (nonatomic,strong) UILabel * title;
// 购买
@property (nonatomic,strong) UIButton * buyBtn;

@end

@implementation PMCommditTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.iconimgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, self.bounds.size.width/4, self.bounds.size.width/4)];
        [self addSubview:self.iconimgView];
        
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(self.iconimgView.maxX+10, self.iconimgView.y, self.bounds.size.width-self.iconimgView.width-20, 40)];
        self.title.font = [UIFont systemFontOfSize:15.0];
        self.title.numberOfLines = 0;
        [self addSubview:self.title];
        
        self.buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buyBtn.frame = CGRectMake(self.title.x, self.title.maxY+10, self.bounds.size.width/4, 25);
        self.buyBtn.backgroundColor = [UIColor redColor];
        [self.buyBtn setTitle:@"购买" forState:UIControlStateNormal];
        [self.buyBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.buyBtn.layer.cornerRadius = 5.0;
        self.buyBtn.layer.masksToBounds = YES;
        self.buyBtn.tag = 1001011;
        [self.buyBtn addTarget:self action:@selector(buyBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.buyBtn];
    }
    return self;
}

-(void)setDict:(NSDictionary *)dict{
    
    _dict = dict;
    if (dict[@"img"] && dict[@"title"]) {
        self.iconimgView.image = [UIImage imageNamed:dict[@"img"]];
        self.title.text = dict[@"title"];
    }
}

-(void)buyBtnAction:(UIButton *)sender{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"BuyCommdityName" object:nil userInfo:@{@"Value":@(sender.tag)}];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
