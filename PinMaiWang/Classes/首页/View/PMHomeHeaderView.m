//
//  PMHomeHeaderView.m
//  PinMaiWang
//
//  Created by 嚼华先森 on 2017/6/20.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMHomeHeaderView.h"
#import "XRCarouselView.h"
#import "SGAdvertScrollView.h"

@interface PMHomeHeaderView ()<XRCarouselViewDelegate,SGAdvertScrollViewDelegate>
@property (nonatomic,strong) XRCarouselView * topScrollView;
@property (nonatomic,strong) UIButton * itemBtn;

@end

@implementation PMHomeHeaderView

+(PMHomeHeaderView *)initializeWithHomeHeaderView:(UIView *)homeHeaderView WithFrame:(CGRect)frame{
    
    PMHomeHeaderView *headerView = [[PMHomeHeaderView alloc]initWithFrame:frame];
    [homeHeaderView addSubview:headerView];
    return headerView;
    
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setUpHomeHeaderView];
    }
    return self;
}

-(void)setUpHomeHeaderView{
    
    self.topScrollView = [[XRCarouselView alloc]initWithFrame:CGRectMake(0, 0, XHB_SCREEN_WIDTH, XHB_SCREEN_WIDTH/1.5)];
    NSArray *array = @[@"https://ht.pmb2b.com/uploads/ad/4d129ee9-e5fa-4388-b3e3-60b8040fda56.jpg",
                       @"https://ht.pmb2b.com/uploads/ad/8fe96d52-fdf9-4428-8fc5-757d6911cf12.jpg",
                       @"https://ht.pmb2b.com/uploads/ad/8faf72e5-7804-4779-be65-f08916063552.jpg",
                       @"https://ht.pmb2b.com/uploads/ad/500b130a-15eb-4350-b864-ac84b5651c12.jpg",
                       @"https://ht.pmb2b.com/uploads/ad/eb6187ad-36ce-4ce3-a5ff-cf945a2fe1af.jpg"
                       ];
    self.topScrollView.imageArray = array;
    self.topScrollView.delegate = self;
    self.topScrollView.changeMode = ChangeModeDefault;
    self.topScrollView.time = 3;
    [self.topScrollView setPageColor:[UIColor whiteColor] andCurrentPageColor:[UIColor redColor]];
    [self addSubview:self.topScrollView];
    
    NSArray *titles = @[@"龙虾",@"蟹类",@"生蚝",@"鲍鱼",@"象拔蚌",@"冻虾",@"冻蟹",@"冻鱼",@"冻贝",@"冻肉"];
    NSArray *imgs = @[@"index_lx",@"index_xl",@"index_sh",@"index_by",@"index_xbb",@"index_dxia",@"index_dxie",@"index_dy",@"index_db",@"index_qt"];
    
    for (int i = 0; i < 10; i++) {
        self.itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (UI_IS_IPHONE5) {
            self.itemBtn.frame = CGRectMake((i%5)*((self.bounds.size.width-30)/5+5)+5, self.topScrollView.maxY+10+(i/5)*(self.bounds.size.width/5+5), (self.bounds.size.width-30)/5, self.bounds.size.width/5);
            [self.itemBtn setImage:[UIImage resizeImage:[UIImage imageNamed:imgs[i]] toNewSize:CGSizeMake(40, 40)] forState:UIControlStateNormal];
            self.itemBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.itemBtn.titleEdgeInsets = UIEdgeInsetsMake(40, -45, -5, 5);
            self.itemBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 25, 0);
            self.itemBtn.titleLabel.font = [UIFont systemFontOfSize:12.0];
            
        }else if (UI_IS_IPHONE6){
            self.itemBtn.frame = CGRectMake((i%5)*((self.bounds.size.width-30)/5+5)+5, self.topScrollView.maxY+10+(i/5)*(self.bounds.size.width/5+5), (self.bounds.size.width-30)/5, self.bounds.size.width/5);
            [self.itemBtn setImage:[UIImage resizeImage:[UIImage imageNamed:imgs[i]] toNewSize:CGSizeMake(50, 50)] forState:UIControlStateNormal];
            self.itemBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.itemBtn.titleEdgeInsets = UIEdgeInsetsMake(50, -50, -5, 5);
            self.itemBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 25, 0);
            self.itemBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
            
        }else{
            
            self.itemBtn.frame = CGRectMake((i%5)*((self.bounds.size.width-30)/5+5)+5, self.topScrollView.maxY+10+(i/5)*(self.bounds.size.width/5+5), (self.bounds.size.width-30)/5, self.bounds.size.width/5);
            [self.itemBtn setImage:[UIImage resizeImage:[UIImage imageNamed:imgs[i]] toNewSize:CGSizeMake(60, 60)] forState:UIControlStateNormal];
            self.itemBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
            self.itemBtn.titleEdgeInsets = UIEdgeInsetsMake(60, -60, -5, 5);
            self.itemBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 25, 0);
            self.itemBtn.titleLabel.font = [UIFont systemFontOfSize:17.0];
        }
        
        self.itemBtn.tag = i;
        [self.itemBtn setTitle:titles[i] forState:UIControlStateNormal];
        [self.itemBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.itemBtn addTarget:self action:@selector(itemBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.itemBtn];
    }
    
#pragma mark 消息资讯轮播
    UIImageView *new = [[UIImageView alloc]initWithFrame:CGRectMake(10, self.itemBtn.maxY+5, 35, 35)];
    new.image = [UIImage imageNamed:@"news_1"];
    [self addSubview:new];
    
    SGAdvertScrollView *notice = [[SGAdvertScrollView alloc]init];
    notice.frame = CGRectMake(new.maxX, self.itemBtn.maxY+10, self.bounds.size.width-20, 25);
    notice.titleColor = [[UIColor blackColor] colorWithAlphaComponent:1.0];
    notice.scrollTimeInterval = 2;
    notice.leftImageString = @"news_2";
    notice.delegateAdvertScrollView = self;
    notice.titles = [NSMutableArray arrayWithObjects:@"暴走大事件",@"王尼玛",@"张全蛋",@"五道杠大队长",@"赵铁柱",@"其实我也不知道写什么了.....", nil];
    notice.titleFont = [UIFont systemFontOfSize:15.0];
    [self addSubview:notice];
    
    UIImageView *billboardView = [[UIImageView alloc]initWithFrame:CGRectMake(0, notice.maxY+5, XHB_SCREEN_WIDTH, XHB_SCREEN_HEIGHT*0.22)];
    billboardView.image = [UIImage imageNamed:@"cdw"];
    [self addSubview:billboardView];
    
    UIButton *newBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    newBtn.frame = CGRectMake(0, billboardView.maxY+5, self.bounds.size.width, 30);
    [newBtn setImage:[UIImage resizeImage:[UIImage imageNamed:@"index_05"] toNewSize:CGSizeMake(30, 20)] forState:UIControlStateNormal];
    [newBtn setTitle:@"最新上线" forState:UIControlStateNormal];
    [newBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    newBtn.titleLabel.font = [UIFont systemFontOfSize:14.0];
    newBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -200, 0, 0);
    newBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -180, 0, 0);
    [self addSubview:newBtn];
    


}


-(void)carouselView:(XRCarouselView *)carouselView clickImageAtIndex:(NSInteger)index{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"Index" object:nil userInfo:@{@"Value":@(index)}];
}

-(void)itemBtnAction:(UIButton *)sender{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"itemBtnTag" object:nil userInfo:@{@"Value":@(sender.tag)}];

}

-(void)advertScrollView:(SGAdvertScrollView *)advertScrollView didSelectedItemAtIndex:(NSInteger)index{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"noticeIndex" object:nil userInfo:@{@"Value":@(index)}];
}

@end
