//
//  TestVC.m
//  缓存tableViewCell的高
//
//  Created by 黄俊煌 on 2017/12/10.
//  Copyright © 2017年 hongsui. All rights reserved.
//

#import "TestVC.h"
#import "UITableView+CacheHeight.h"

@interface TestVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"缓存tableViewCell的高";
    cell.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSLog(@"indexPath = %@",indexPath);
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView heightForIndexPath:indexPath normalHeight:40+indexPath.row*20];
    
//    CGFloat height = [tableView heightForIndexPath:indexPath];
//    if (height < 1) {
//        [tableView setHeight:40+indexPath.row*20 forIndexPath:indexPath];
//        return 40+indexPath.row*20;
//    }
//    return height;
}

- (UITableView *)tableView {
    if (_tableView) return _tableView;
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    return _tableView;
}

@end
