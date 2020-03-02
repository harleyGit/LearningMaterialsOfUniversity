//
//  person.h
//  05.InitMethod
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    NSString *_name;    //姓名年龄
    int _age;           //年龄
}

//自定义初始化方法，将姓名name传入

- (id)initWithName:(NSString *)name;

//方法名：initWithName:withAge:
- (id)initWithName:(NSString *)name withAge:(int)age; //id initWithName(NSString *name,int age)

//修改姓名的方法
- (void)setName:(NSString *)name;

//打印信息
- (void)showInfo;

@end
