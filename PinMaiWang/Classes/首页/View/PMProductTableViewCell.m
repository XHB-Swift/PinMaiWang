//
//  PMProductTableViewCell.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/6/19.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMProductTableViewCell.h"

@implementation PMProductTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 3, self.bounds.size.width/3, self.bounds.size.width/3)];
        self.imgView.backgroundColor = [UIColor redColor];
        [self addSubview:self.imgView];
        
        
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.imgView.frame)+5, 10, self.bounds.size.width-self.imgView.bounds.size.width-50, 30)];
        //        self.title.backgroundColor = [UIColor yellowColor];
        [self addSubview:self.title];
        
        self.place = [[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width-30, 5, 20, 20)];
        [self addSubview:self.place];
        
        self.size = [[UILabel alloc]initWithFrame:CGRectMake(self.bounds.size.width/3+5, CGRectGetMaxY(self.title.frame), self.title.bounds.size.width, 20)];
        [self addSubview:self.size];
        
        self.price = [[UILabel alloc]initWithFrame:CGRectMake(self.bounds.size.width/3+5, CGRectGetMaxY(self.size.frame), self.size.bounds.size.width, 20)];
        self.price.font = [UIFont systemFontOfSize:12.0];
        self.price.textColor = [UIColor redColor];
        [self addSubview:self.price];
        
        self.total = [[UILabel alloc]initWithFrame:CGRectMake(self.bounds.size.width/3+5, CGRectGetMaxY(self.price.frame), self.bounds.size.width/3, 20)];
        self.total.font = [UIFont systemFontOfSize:12.0];
        self.total.textColor = [UIColor redColor];
        [self addSubview:self.total];
        
        self.sold = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.total.frame)+5, CGRectGetMaxY(self.price.frame), self.bounds.size.width/3-15, 20)];
        self.sold.font = [UIFont systemFontOfSize:12.0];
        [self addSubview:self.sold];
        
        self.sellUp = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width/3+5, CGRectGetMaxY(self.size.frame)+5, self.bounds.size.width/2.5, 30)];
        self.sellUp.textColor = [UIColor redColor];
        self.sellUp.textAlignment = NSTextAlignmentCenter;
        self.sellUp.layer.borderColor = [UIColor redColor].CGColor;
        self.sellUp.layer.borderWidth = 1;
        self.sellUp.layer.cornerRadius = 2;
        self.sellUp.layer.masksToBounds = YES;
        
        [self addSubview:self.sellUp];
        
    }
    return self;
}


-(void)setModel:(PMProductModel *)model{
    
    _model = model;
    self.title.text = model.name;
    NSMutableAttributedString *attText = [[NSMutableAttributedString alloc]initWithString:model.number];
    [attText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20.0] range:NSMakeRange(1, 5)];
    self.price.attributedText = attText;
    self.total.text = model.allNumb;
//    self.size.text = model.sizes;
    self.sold.text = model.CutePet;
    self.sellUp.text = model.sellOut;
    self.imgView.image = [UIImage imageNamed:model.img];
    self.place.image = [UIImage imageNamed:model.pic];

}

@end
