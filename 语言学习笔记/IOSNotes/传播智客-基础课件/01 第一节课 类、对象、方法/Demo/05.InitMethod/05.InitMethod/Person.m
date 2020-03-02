//
//  person.m
//  05.InitMethod
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"

@implementation Person

//初始化方法只能创建的时候调用一次
- (id)initWithName:(NSString *)name {
    
    //调用父类的init初始化方法
    self = [super init];
    
    if(self != nil) {
        _name = name;
    }
    
    return self;
}

- (id)initWithName:(NSString *)name withAge:(int)age {
    
    self = [super init];

    
    
    if (self != nil) {
        _name = name;
        _age = age;
    }
    
    return self;
}

//修改姓名的方法
- (void)setName:(NSString *)name {
    _name = name;
}


- (void)showInfo {
    
    NSLog(@"姓名：%@,年龄：%d",_name,_age);
}

@end
