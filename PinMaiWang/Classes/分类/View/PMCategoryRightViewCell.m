//
//  PMCategoryRightViewCell.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/18.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMCategoryRightViewCell.h"

#define RIGHT_CELL_IMAGEVIEW_TAG 1000
#define RIGHT_CELL_LABEL_TAG     RIGHT_CELL_IMAGEVIEW_TAG * 2

@implementation PMCategoryRightViewCell

+ (UICollectionViewCell *)cellForCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath withDictionary:(NSDictionary *)dict {
    
    PMCategoryRightViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[PMCategoryRightViewCell cellIdentifier] forIndexPath:indexPath];
    
    [cell configureCellWithDictionary:dict];
    
    return cell;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self=[super initWithFrame:frame]) {
        [self initializeContentView];
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIImageView *imageView = [self.contentView viewWithTag:RIGHT_CELL_IMAGEVIEW_TAG];
    UILabel *label = [self.contentView viewWithTag:RIGHT_CELL_LABEL_TAG];
    if (CGRectEqualToRect(imageView.frame, CGRectZero) || CGRectEqualToRect(label.frame, CGRectZero)) {
        
        imageView.frame = CGRectMake(10, 10, self.width-20, self.height-50);
        label.frame = CGRectMake(0, imageView.maxY, self.width, 50);
        
    }
    
}

- (void)initializeContentView {
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.tag = RIGHT_CELL_IMAGEVIEW_TAG;
    
    UILabel *label = [[UILabel alloc] init];
    label.tag = RIGHT_CELL_LABEL_TAG;
    label.textAlignment = NSTextAlignmentCenter;
    
    [self.contentView addSubview:imageView];
    [self.contentView addSubview:label];
    
//    XHBLogSize(self.size);
    
}

- (void)configureCellWithDictionary:(NSDictionary *)dict {
    
    UIImageView *imageView = [self.contentView viewWithTag:RIGHT_CELL_IMAGEVIEW_TAG];
    UILabel *label = [self.contentView viewWithTag:RIGHT_CELL_LABEL_TAG];
    
    imageView.backgroundColor = dict[@"imgColor"];
    label.text = dict[@"lblTxt"];
    
}

@end
