//
//  UICollectionViewCell+Identifier.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/18.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "UICollectionViewCell+Identifier.h"

@implementation UICollectionViewCell (Identifier)

+ (NSString *)cellIdentifier {
    
    return NSStringFromClass([self class]);
}

+ (UICollectionViewCell *)cellForCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath withAnyData:(id)anyData {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[self cellIdentifier] forIndexPath:indexPath];
    
    [cell configureCellWithAnyData:anyData];
    
    return cell;
    
}

+ (UICollectionViewCell *)cellForCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath withDictionary:(NSDictionary *)dict {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[self cellIdentifier] forIndexPath:indexPath];
    
    [cell configureCellWithDictionary:dict];
    
    return cell;

}

- (void)configureCellWithAnyData:(id)anyData {
    
}

- (void)configureCellWithDictionary:(NSDictionary *)dict {
    
}

@end
