//
//  PMShareCollectionViewCell.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/27.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMShareCollectionViewCell.h"

NSString *const PMShareImageKey = @"PMShareImageKey";
NSString *const PMShareTitleKey = @"PMShareTitleKey";

@interface PMShareCollectionViewCell ()

@property (nonatomic, strong) UIImageView *shareIcon;
@property (nonatomic, strong) UILabel     *shareTitle;

@end

@implementation PMShareCollectionViewCell

+ (UICollectionViewCell *)cellForCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath withDictionary:(NSDictionary *)dict {
    
    PMShareCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[PMShareCollectionViewCell cellIdentifier] forIndexPath:indexPath];
    
    [cell configureCellWithDictionary:dict];
    
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self createContentView];
    }
    
    return self;
}

- (void)createContentView {
    
    self.backgroundColor = [UIColor whiteColor];
    self.shareIcon = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 70, 70)];
    self.shareTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, self.shareIcon.maxY, self.shareIcon.width, 30)];
    self.shareTitle.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview:self.shareIcon];
    [self.contentView addSubview:self.shareTitle];
}

- (void)configureCellWithDictionary:(NSDictionary *)dict {
    
    self.shareIcon.image = dict[PMShareImageKey];
    self.shareTitle.text = dict[PMShareTitleKey];
    
}

@end
