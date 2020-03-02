//
//  Taxi.m
//  07.Private
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Taxi.h"

@implementation Taxi

- (void)run {
//    NSLog(@"%@出租车启动了",_brand);  //错误，_brand是私有的，子类无法使用
    
    //_name属性时受保护的，子类可以使用
    NSLog(@"%@出租车启动了",_name);
}

@end
