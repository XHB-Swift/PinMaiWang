//
//  PMCategoryItemView.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMCategoryItemView.h"

#define PM_CATEGORY_ITEM_IMAGEVIEW_TAG 1000
#define PM_CATEGORY_ITEM_LABEL_TAG 2000

@interface PMCategoryItemView ()

@property (nonatomic,copy)   UIImage *norImage;
@property (nonatomic,copy)   UIImage *selImage;

@end

@implementation PMCategoryItemView

+ (instancetype)categoryItemWithName:(NSString *)aName NormalImage:(UIImage *)norImage SelectedImage:(UIImage *)selImage {
    
    PMCategoryItemView *item = [[PMCategoryItemView alloc] initWithName:aName NormalImage:norImage SelectedImage:selImage];
    
    return item;
}

- (instancetype)initWithName:(NSString *)aName NormalImage:(UIImage *)norImage SelectedImage:(UIImage *)selImage {
    
    if (self=[super init]) {
        [self initializeItemWithName:aName NormalImage:norImage SelectedImage:selImage];
    }
    
    return self;
}

- (void)initializeItemWithName:(NSString *)aName NormalImage:(UIImage *)norImage SelectedImage:(UIImage *)selImage {
    
    self.userInteractionEnabled = YES;
    self.backgroundColor = [UIColor whiteColor];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(broadcastItemTapped:)];
    [self addGestureRecognizer:tapGesture];
    
    self.norImage = [norImage resizeImageToSize:CGSizeMake(30, 30)];
    self.selImage = [selImage resizeImageToSize:CGSizeMake(30, 30)];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:self.norImage];
    imageView.tag = PM_CATEGORY_ITEM_IMAGEVIEW_TAG;
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, imageView.maxY, self.width, 30)];
    label.height = 30;
    label.text = aName;
    label.textColor = PM_CATEGORY_NORMAL_COLOR;
    label.tag = PM_CATEGORY_ITEM_LABEL_TAG;
    label.font = XHBSystemFont(13);
    label.textAlignment = NSTextAlignmentCenter;
    
//    self.height = label.maxY+5;
    
    [self addSubview:imageView];
    [self addSubview:label];
}

- (void)adjustItemViewFrame {
    
    UIImageView *imageView = [self viewWithTag:PM_CATEGORY_ITEM_IMAGEVIEW_TAG];
    UILabel *label = [self viewWithTag:PM_CATEGORY_ITEM_LABEL_TAG];
    if (CGPointEqualToPoint(imageView.origin, CGPointZero) || CGPointEqualToPoint(label.origin, CGPointZero)) {
        
        imageView.origin = CGPointMake((self.width-imageView.width)/2, 10);
        label.origin = CGPointMake(0, imageView.maxY);
        if (label.width == 0) {
            label.width = self.width;
            self.height = label.maxY+5;
        }
    }
    
}

- (void)setState:(BOOL)state {
    
    _state = state;
    UIImageView *imageView = [self viewWithTag:PM_CATEGORY_ITEM_IMAGEVIEW_TAG];
    UILabel *label = [self viewWithTag:PM_CATEGORY_ITEM_LABEL_TAG];
    imageView.image = state ? self.selImage : self.norImage;
    label.textColor = state ? PM_CATEGORY_SELECT_COLOR : PM_CATEGORY_NORMAL_COLOR;
    
}

- (void)broadcastItemTapped:(UITapGestureRecognizer *)sender {
    
    XHBPostNotification(PM_CATEGORY_ITEM_NOTICATION, @(self.tag));
    
}

@end
