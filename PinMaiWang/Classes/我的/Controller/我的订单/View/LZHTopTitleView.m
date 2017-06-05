//
//  LZHTopTitleView.m
//  TopTitleView
//
//  Created by 嚼华先森 on 2017/6/5.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "LZHTopTitleView.h"

@interface LZHTopTitleView ()<UIScrollViewDelegate>
@property (nonatomic,assign) CGFloat  titleHeight;
@property (nonatomic,assign) CGFloat  lineViewWidth;

@property (nonatomic,strong) UISegmentedControl * titleSegment;
@property (nonatomic,strong) UIScrollView * pageScrollerView;
@property (nonatomic,strong) UIView * lineView;



@end

@implementation LZHTopTitleView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self= [super initWithFrame:frame]) {
        
        [self setting];
    }
    return self;
}

-(void)setting{
    
    self.titleHeight = 40.0;
    self.titleSegment = [[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.titleHeight)];
    self.titleSegment.tintColor = [UIColor clearColor];
    NSDictionary*selectTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15.0],NSForegroundColorAttributeName:[UIColor redColor]};
    [self.titleSegment setTitleTextAttributes:selectTextAttributes forState:UIControlStateSelected];
    
    NSDictionary *unselectedTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:12.0],
                                               NSForegroundColorAttributeName:[UIColor grayColor]};
    [self.titleSegment setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    [self.titleSegment addTarget:self action:@selector(pageChange:) forControlEvents:UIControlEventValueChanged];
    [self addSubview:self.titleSegment];
    
    
    // 滑动ScrollView
    self.pageScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleSegment.frame), self.frame.size.width, self.frame.size.height-self.titleHeight)];
    self.pageScrollerView.bounces = YES;
    self.pageScrollerView.pagingEnabled = YES;
    self.pageScrollerView.showsVerticalScrollIndicator = NO;
    self.pageScrollerView.showsHorizontalScrollIndicator = NO;
    self.pageScrollerView .delegate = self;
    [self addSubview:self.pageScrollerView];
    
    // 底部滑动线
    self.lineView = [[UIView alloc]init];
    self.lineView.backgroundColor = [UIColor redColor];
    [self addSubview:self.lineView];
    
    //初始化默认为第一页
    self.curPage = 0;
}

- (void)setCurPage:(NSInteger)curPage {
    
    if (curPage>=self.titleSegment.numberOfSegments) {
        return;
    }
    
    _curPage = curPage;
    self.titleSegment.selectedSegmentIndex = curPage;
    [self pageChange:self.titleSegment];
}

-(void)setTitles:(NSArray *)titles{
    
    if (titles.count>0) {
        
        for (NSInteger i = 0; i < titles.count; i++) {
            [self.titleSegment insertSegmentWithTitle:[titles objectAtIndex:i] atIndex:i animated:NO];
        }
    }
    
}

-(void)SetUpViewControllerWithFatherVC:(UIViewController *)fatherVC ChildVC:(NSArray<UIViewController *> *)childVC{
    
    NSInteger page = childVC.count;
    self.lineViewWidth = self.frame.size.width/page;
    self.lineView.frame = CGRectMake(0, self.titleHeight-1, self.lineViewWidth, 1);
    self.pageScrollerView.contentSize = CGSizeMake(self.frame.size.width*page, 0);
    
    for (NSInteger i = 0; i <page; i++) {
        UIViewController *VC = [childVC objectAtIndex:i];
        VC.view.frame = CGRectMake(self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height);
        [fatherVC addChildViewController:VC];
        [self.pageScrollerView addSubview:VC.view];
    }
    
}

// 联动
-(void)pageChange:(UISegmentedControl *)sender{
    
    [self changeWithPage:sender.selectedSegmentIndex];
    [self.pageScrollerView setContentOffset:CGPointMake(self.width*sender.selectedSegmentIndex, 0) animated:YES];
    XHBLogObject(@"改变页数");
}


-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger page = scrollView.contentOffset.x/self.frame.size.width;
    self.titleSegment.selectedSegmentIndex = page;
    [self changeWithPage:page];
    
}

-(void)changeWithPage:(NSInteger )page{
    CGFloat lineViewCenterX = page*self.lineViewWidth+self.lineViewWidth/2;
    [UIView transitionWithView:self.lineView duration:0.3 options:UIViewAnimationOptionAllowUserInteraction animations:^{
       
        self.lineView.center = CGPointMake(lineViewCenterX, self.titleHeight-.5);
    } completion:^(BOOL finished) {
        
    }];
    
}


@end
