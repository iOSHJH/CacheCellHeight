//
//  UITableView+CacheHeight.h
//  缓存tableViewCell的高
//
//  Created by 黄俊煌 on 2017/12/5.
//  Copyright © 2017年 hongsui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CacheHeight)

- (CGFloat)heightForIndexPath:(NSIndexPath *)indexPath normalHeight:(CGFloat)normalHeight;

@end
