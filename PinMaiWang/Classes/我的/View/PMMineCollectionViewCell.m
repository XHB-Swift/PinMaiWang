//
//  PMMineCollectionViewCell.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/5/18.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMMineCollectionViewCell.h"

@interface PMMineCollectionViewCell ()

@property (nonatomic,strong) UIImageView * imageView;
@property (nonatomic,strong) UILabel * label;


@end

@implementation PMMineCollectionViewCell

-(void)setMineDict:(NSDictionary *)mineDict{
    
    _mineDict = mineDict;
    if (mineDict[@"image"] && mineDict[@"title"]) {
        self.imageView.image = [UIImage imageNamed:mineDict[@"image"]];
        self.label.text = mineDict[@"title"];
    }
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setUpCells];
    }
    return self;
}

-(void)setUpCells{
    self.backgroundColor = [UIColor whiteColor];
    self.imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 38, 38)];
    self.imageView.center = CGPointMake(self.contentView.width/2, self.contentView.height/2);
    
    self.label = [[UILabel alloc]initWithFrame:CGRectMake(10, self.imageView.maxY+5, self.contentView.width-20, 20)];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:15.0];
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.label];
    
}

@end
