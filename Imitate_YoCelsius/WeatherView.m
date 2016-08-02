//
//  WeatherView.m
//  Imitate_YoCelsius
//
//  Created by mac on 16/8/1.
//  Copyright © 2016年 Unique. All rights reserved.
//

#import "WeatherView.h"

@interface WeatherView ()<UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@end


@implementation WeatherView


// 构建视图
- (void)buildView {
    
    /*
     *  总视图 加载各种天气视图
     */
    
    /*
     * 此处使用UITableView只是为了使用滑动功能  不需要实现协议方法
     */
    
    _tableView                 = [[UITableView alloc] initWithFrame:self.bounds
                                                              style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate        = self;
    _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
    [self addSubview:_tableView];
    
    
    
}




@end
