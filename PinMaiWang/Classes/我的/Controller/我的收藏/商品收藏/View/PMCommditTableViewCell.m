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
        self.iconimgView.backgroundColor = [UIColor redColor];
        [self addSubview:self.iconimgView];
        
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(self.iconimgView.maxX+10, self.iconimgView.y, self.bounds.size.width-self.iconimgView.width-20, 40)];
        self.title.backgroundColor = [UIColor redColor];
        [self addSubview:self.title];
        
        self.buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.buyBtn.frame = CGRectMake(self.title.x, self.title.maxY+5, self.bounds.size.width/3, 30);
        self.buyBtn.backgroundColor = [UIColor greenColor];
        [self addSubview:self.buyBtn];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
