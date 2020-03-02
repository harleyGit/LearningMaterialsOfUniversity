//
//  Worker.m
//  Task1
//
//  Created by wei.chen on 13-7-29.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Worker.h"

@implementation Worker

- (void)work {
    NSLog(@"姓名：%@,年龄：%d，工资：%f 正在工作...",_name,_age,_money);
}

- (void)setName:(NSString *)name {
    _name = name;
}
- (void)setAge:(int)age {
    _age = age;
}
- (void)setMoney:(float)money {
    _money = money;
}

- (NSString *)description {
    NSString *s = [NSString stringWithFormat:@"name=%@,age=%d,money=%f",_name,_age,_money];
    return s;
}

@end
