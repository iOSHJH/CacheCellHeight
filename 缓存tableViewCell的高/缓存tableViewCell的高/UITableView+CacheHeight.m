//
//  UITableView+CacheHeight.m
//  缓存tableViewCell的高
//
//  Created by 黄俊煌 on 2017/12/5.
//  Copyright © 2017年 hongsui. All rights reserved.
//

/*
    让tableview默认创建一个字典 用来存储所有cell的高
 */

#import "UITableView+CacheHeight.h"
#import <objc/runtime.h>

static NSString *heightKey = @"heightKey";

@implementation UITableView (CacheHeight)

- (void)setHeigthDict:(NSMutableDictionary *)heigthDict {
    objc_setAssociatedObject(self, &heightKey, heigthDict, OBJC_ASSOCIATION_RETAIN);
}

- (NSMutableDictionary *)heigthDict {
    if (objc_getAssociatedObject(self, &heightKey)) {
        return objc_getAssociatedObject(self, &heightKey);
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [self setHeigthDict:dict];
    return dict;
}

/// 返回缓存的高，如果没缓存就返回默认的高normalHeight
- (CGFloat)heightForIndexPath:(NSIndexPath *)indexPath normalHeight:(CGFloat)normalHeight {
    NSString *key = [NSString stringWithFormat:@"%zd%zd",indexPath.section,indexPath.row];
    NSMutableDictionary *dict = [self heigthDict];
    
    NSString *value = [dict valueForKey:key];
    
    if (value.floatValue < 1) {
        [dict setValue:[NSString stringWithFormat:@"%f",normalHeight] forKey:key];
        return normalHeight;
    }else {
        return value.floatValue;
    }
}

@end
