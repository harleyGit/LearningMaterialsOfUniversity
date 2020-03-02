//
//  Person.m
//  01.Person
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)setAge:(int)age {
    
    //加入条件判断
    if(age > 0 && age < 120) {
        _age = age;
    }
    else {
        NSLog(@"年龄不科学");
    }
}

- (int)age {
    return _age;
}

@end
