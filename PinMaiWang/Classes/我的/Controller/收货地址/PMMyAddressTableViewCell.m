//
//  PMMyAddressTableViewCell.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/28.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMMyAddressTableViewCell.h"

@implementation PMMyAddressTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self =[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.name = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, self.contentView.bounds.size.width/2, 20)];
        self.name.font =[UIFont systemFontOfSize:15.0];
        [self addSubview:self.name];
        
        self.number = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.name.bounds), 5, self.name.bounds.size.width-5, self.name.bounds.size.height)];
        self.number.textAlignment = NSTextAlignmentRight;
        self.number.font = [UIFont systemFontOfSize:15.0];
        [self addSubview:self.number];
        
        self.address = [[UILabel alloc]initWithFrame:CGRectMake(5, CGRectGetMaxY(self.number.frame)+10, self.bounds.size.width-10, 60)];
        self.address.font = [UIFont systemFontOfSize:14.0];
        self.address.numberOfLines = 0;
        [self addSubview:self.address];
        
        UIView *centre = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.address.frame), self.bounds.size.width, 1)];
        centre.backgroundColor = XHBRGBColor(244, 244, 244);
        [self addSubview:centre];
        
        self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.btn.frame = CGRectMake(self.bounds.size.width-self.bounds.size.width/4, CGRectGetMaxY(centre.frame)+10, self.bounds.size.width/4-10, 30);
        [self.btn setTitle:@"编辑" forState:UIControlStateNormal];
        self.btn.tag = 100101011;
        [self.btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.btn];
        
        self.defaultBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.defaultBtn.frame = CGRectMake(self.address.x, centre.maxY+10, self.bounds.size.width/2, 30);
        [self.defaultBtn setTitle:@"设为默认" forState:UIControlStateNormal];
        [self.defaultBtn setTitle:@"默认地址" forState:UIControlStateSelected];
        [self.defaultBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        [self.defaultBtn addTarget:self action:@selector(defaultBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.defaultBtn];
        
        
        UIView *bottom = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.btn.frame), self.bounds.size.width, 9)];
        bottom.backgroundColor = XHBRGBColor(244, 244, 244);
        [self addSubview:bottom];
        
    }
    return self;
}

-(void)btnAction:(UIButton *)sender{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"userEditAddress" object:nil userInfo:@{@"Value":@(sender.tag)}];
    
    
}

-(void)defaultBtnAction:(UIButton *)sender{
    
    sender.selected =! sender.selected;
    XHBLogObject(@"你敢动我试试?");
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
