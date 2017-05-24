//
//  PMDetailViewModel.m
//  PinMaiWang
//
//  Created by 谢鸿标 on 2017/5/20.
//  Copyright © 2017年 嚼华. All rights reserved.
//

#import "PMDetailViewModel.h"
#import "PMDetailTitleViewCell.h"
#import "PMDetailAdsViewCell.h"

NSString *const PMDetailViewCellTypeTitle =
@"PMDetailViewCellTypeTitle";
NSString *const PMDetailViewCellTypeDelivery =
@"PMDetailViewCellTypeDelivery";
NSString *const PMDetailViewCellTypeAds =
@"PMDetailViewCellTypeAds";
NSString *const PMDetailViewCellTypeNorms =
@"PMDetailViewCellTypeNorms";
NSString *const PMDetailViewCellTypeAddress =
@"PMDetailViewCellTypeAddress";
NSString *const PMDetailViewCellTypeComment =
@"PMDetailViewCellTypeComment";

typedef void(^PMViewModelOption)(PMDetailViewModel *vm);

@interface PMDetailViewModel ()

@property (nonatomic,strong) NSDictionary *data;

@end

@implementation PMDetailViewModel

+ (instancetype)detailViewModelWithCellType:(NSString *)aCellType data:(NSDictionary *)data canBeClicked:(BOOL)can{
    
    PMDetailViewModel *vm = [[PMDetailViewModel alloc] init];
    [vm configureViewModelWithCellType:aCellType data:data canBeClicked:can];
    return vm;
}

- (void)setCanClicked:(BOOL)canClicked {
    
    _canClicked = canClicked;
    
}

- (void)configureViewModelWithCellType:(NSString *)aCellType data:(NSDictionary *)data canBeClicked:(BOOL)can{
    
    self.data = data;
    self.curCellType = aCellType;
    self.canClicked = can;
    static NSDictionary<id,PMViewModelOption> *mapDict = nil;
    
    if (!mapDict) {
        
        mapDict = @{PMDetailViewCellTypeTitle:vm_opt_title,
                    PMDetailViewCellTypeDelivery:vm_opt_delivery,
                    PMDetailViewCellTypeAds:vm_opt_ads,
                    PMDetailViewCellTypeNorms:vm_opt_norms,
                    PMDetailViewCellTypeAddress:vm_opt_address,
                    PMDetailViewCellTypeComment:vm_opt_comment};
        
    }
    
    mapDict[aCellType](self);
    
}

- (void)setCellTypeOfData:(NSDictionary<NSString *,id> *)cellTypeOfData {
    
    _cellTypeOfData = cellTypeOfData;
}

- (void)setCellIdentifier:(NSString *)cellIdentifier {
    
    _cellIdentifier = [cellIdentifier copy];
    
}

- (void)setCurCellType:(NSString *)curCellType {
    
    _curCellType = [curCellType copy];
}

- (void)setCellHeight:(CGFloat)cellHeight {
    
    _cellHeight = cellHeight;
}

#pragma mark 详情页标题cell
static PMViewModelOption vm_opt_title = ^(PMDetailViewModel *vm){
    
    vm.cellTypeOfData = @{PMDetailViewCellTypeTitle:@{
                                  PMDetailViewCellImageKey:@"",
                                  PMDetailViewCellTitleKey:@"新西兰剥皮鱼",
                                  PMDetailViewCellDescKey:@"肉质紧致 细腻顺滑",
                                  PMDetailViewCellPriceKey:@"￥58"
                                  }};
    vm.cellIdentifier = [PMDetailTitleViewCell cellIdentifier];
    vm.cellHeight = 100.f;
    
};

#pragma mark 快递cell
static PMViewModelOption vm_opt_delivery = ^(PMDetailViewModel *vm){
    
};

#pragma mark 商家广告cell
static PMViewModelOption vm_opt_ads = ^(PMDetailViewModel *vm){
    
    vm.cellTypeOfData = @{PMDetailViewCellTypeAds:@"每日优选 · 天天鲜不停"};
    vm.cellIdentifier = [PMDetailAdsViewCell cellIdentifier];
    vm.cellHeight = 50.f;
};

#pragma mark 产品规格cell
static PMViewModelOption vm_opt_norms = ^(PMDetailViewModel *vm){
    
};

#pragma makr 收货地址cell
static PMViewModelOption vm_opt_address = ^(PMDetailViewModel *vm){
    
};

#pragma mark 评论cell
static PMViewModelOption vm_opt_comment = ^(PMDetailViewModel *vm){
    
};

@end
