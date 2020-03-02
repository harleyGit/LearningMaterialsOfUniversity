//
//  Person.m
//  2.DefinitionClass
//
//  Created by wei.chen on 13-7-23.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"

@implementation Person

//声明一个shopping方法
- (void)shopping {
    
    NSLog(@"我正在购物~~");
}

//设置姓名的方法
- (void)setName:(NSString *)name {
    _name = name;
}

//访问姓名的方法
- (NSString *)name {
    return _name;
}


//设置年龄的方法
- (void)setAge:(NSInteger)age {
    _age = age;
}

- (NSInteger)age {
    return _age;
}


//打印当前对象的属性信息
- (void)printfInfo {
    NSLog(@"姓名%@,年龄：%ld",_name,_age);
}


//类方法，使用类名调用此方法
+ (void)classMethod:(NSString *)s {
    NSLog(@"s = %@ \n",s);
}

//创建一个Person对象
+ (Person *)createPerson {
    Person *person = [[Person alloc] init];
    
    return person;
}



@end