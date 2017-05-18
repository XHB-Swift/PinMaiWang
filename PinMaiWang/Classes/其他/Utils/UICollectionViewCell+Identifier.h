//
//  UICollectionViewCell+Identifier.h
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/18.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (Identifier)

/**
 表示该cell的重用标识符，子类重写其get方法可以自定义任意值
 */
@property (nonatomic, class, readonly) NSString *cellIdentifier;

/**
 @param collectionView 列表对象
 @param indexPath 索引
 @param dict      使用字典适配数据
 */
+ (__kindof UICollectionViewCell *)cellForCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath withDictionary:(NSDictionary *)dict;
/**
 @param collectionView 列表对象
 @param indexPath 索引
 @param anyData   使用任意类型的对象适配数据
 */

+ (__kindof UICollectionViewCell *)cellForCollectionView:(UICollectionView *)collectionView atIndexPath:(NSIndexPath *)indexPath withAnyData:(id)anyData;

/**
 @param dict 通过字典配置cell的数据（父类空实现，交给子类具体实现）
 */
- (void)configureCellWithDictionary:(NSDictionary *)dict;
/**
 @param anyData 任意的OC类类型配置cell的数据（父类空实现，交给子类具体实现）
 */
- (void)configureCellWithAnyData:(id)anyData;

@end
