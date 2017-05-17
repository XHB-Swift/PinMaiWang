//
//  PMCategoryHeaderView.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/17.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMCategoryHeaderView.h"
#import "PMCategoryItemView.h"

#define PM_CATEGORY_NORM @"PM_CATEGORY_NORM"
#define PM_CATEGORY_SELE @"PM_CATEGORY_SELE"
#define PM_CATEGORY_NAME @"PM_CATEGORY_NAME"

#define PM_CATEGORY_ITEM_RATO 150

static NSArray *categories = nil;

@implementation PMCategoryHeaderView

+ (instancetype)categoryHeaderView {
    
    return [[PMCategoryHeaderView alloc] initWithFrame:CGRectMake(0, 0, XHB_SCREEN_WIDTH, 90)];
}

- (NSArray *)categories {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        categories = @[
  @{PM_CATEGORY_NORM:@"classify_nav01",
    PM_CATEGORY_SELE:@"classify_nav01-1",
    PM_CATEGORY_NAME:@"龙虾"},
  @{PM_CATEGORY_NORM:@"classify_nav02",
    PM_CATEGORY_SELE:@"classify_nav02-1",
    PM_CATEGORY_NAME:@"螃蟹"},
  @{PM_CATEGORY_NORM:@"classify_nav03",
    PM_CATEGORY_SELE:@"classify_nav03-1",
    PM_CATEGORY_NAME:@"贝类"},
  @{PM_CATEGORY_NORM:@"classify_nav04",
    PM_CATEGORY_SELE:@"classify_nav04-1",
    PM_CATEGORY_NAME:@"其它活鲜"},
  @{PM_CATEGORY_NORM:@"classify_nav05",
    PM_CATEGORY_SELE:@"classify_nav05-1",
    PM_CATEGORY_NAME:@"冻品"}
  ];
        
    });
    
    return categories;
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self=[super initWithFrame:frame]) {
        [self initializeHeaderWithCategories];
    }
    
    return self;
    
}

- (void)initializeHeaderWithCategories {
    
    NSArray *items = [self categories];
    CGFloat itemW = self.width / items.count;
    [XHBCenter addObserver:self selector:@selector(handleCategoryItemTapped:) name:PM_CATEGORY_ITEM_NOTICATION object:nil];
    [items enumerateObjectsUsingBlock:^(NSDictionary * _Nonnull item, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSString *name = item[PM_CATEGORY_NAME];
        UIImage  *norImg = [UIImage imageNamed:item[PM_CATEGORY_NORM]];
        UIImage  *selImg = [UIImage imageNamed:item[PM_CATEGORY_SELE]];
        
        PMCategoryItemView *itemView = [PMCategoryItemView categoryItemWithName:name NormalImage:norImg SelectedImage:selImg];
        itemView.frame = CGRectMake(idx*itemW, 0, itemW, self.height);
        itemView.tag = (idx+1) * PM_CATEGORY_ITEM_RATO;
        [itemView setNeedsDisplay];
        itemView.state = idx == 0;
        [self addSubview:itemView];
        
    }];
    
}

- (void)handleCategoryItemTapped:(NSNotification *)notification {
    
    if (notification.object) {
        
        NSInteger itemTag = [notification.object integerValue];
        PMCategoryItemView *itemView = [self viewWithTag:itemTag];
        if (!itemView.state) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"state == %d", YES];
            NSArray<PMCategoryItemView *> *itemViews = [self.subviews filteredArrayUsingPredicate:predicate];
            if (itemViews.count>0) {
                itemViews[0].state = NO;
            }
            itemView.state = YES;
        }
    }
    
    
}

@end
