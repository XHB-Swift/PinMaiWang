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

+ (UICollectionViewCell *)cellForCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath withDictionary:(NSDictionary *)dict {
    
    PMMineCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[PMMineCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    
    [cell configureCellWithDictionary:dict];
    
    return cell;
    
}

- (void)configureCellWithDictionary:(NSDictionary *)dict {
    
    if (dict[@"image"] && dict[@"title"]) {
        self.imageView.image = [UIImage imageNamed:dict[@"image"]];
        self.label.text = dict[@"title"];
        
        CGRectEqualToRect(self.imageView.frame, CGRectZero) ? [self setNeedsDisplay] : nil;
    }
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setUpCells];
    }
    return self;
}

- (void)layoutSubviews {
    
    self.imageView.size = CGSizeApplyAffineTransform(self.imageView.image.size, CGAffineTransformMakeScale(0.5, 0.5));
    self.imageView.center = CGPointMake(self.contentView.width/2, self.contentView.height/2-10);
    self.label.frame = CGRectMake(10, self.imageView.maxY+10, self.contentView.width-20, 20);
    
}

-(void)setUpCells{
    
    self.backgroundColor = [UIColor whiteColor];
    
    self.imageView =[[UIImageView alloc] init];
    self.label = [[UILabel alloc] init];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.font = [UIFont systemFontOfSize:15.0];
    [self.contentView addSubview:self.imageView];
    [self.contentView addSubview:self.label];
    
}

@end
