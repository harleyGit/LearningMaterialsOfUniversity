//
//  Worker.h
//  Task1
//
//  Created by wei.chen on 13-7-29.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

//姓名，年龄，工资
@interface Worker : NSObject {
    NSString *_name;
    int _age;
    float _money;
}

- (void)setName:(NSString *)name;
- (void)setAge:(int)age;
- (void)setMoney:(float)money;

- (void)work;

@end
