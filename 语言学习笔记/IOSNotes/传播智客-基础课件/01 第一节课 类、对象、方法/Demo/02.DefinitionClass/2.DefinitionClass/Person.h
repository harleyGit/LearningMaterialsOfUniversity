//
//  Person.h
//  2.DefinitionClass
//
//  Created by wei.chen on 13-7-23.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    //定义类的属性，都定义在{}中
    
    NSString *_name; //姓名
    //int age;
    NSInteger _age;  //年龄
    
    //float weight;
    //...
    
    //注意：在OC中不能定义属性时，对属性初始化值
    //float height = 1.70;  //错误
}

//声明一个shopping方法
- (void)shopping;

//------------设置器、访问器--------------
//设置姓名的方法
- (void)setName:(NSString *)name;
//访问姓名的方法
- (NSString *)name;  //- (NSString *)getName;  //OC中的访问器不使用getxx这种命名规范

//设置年龄的方法
- (void)setAge:(NSInteger)age;
- (NSInteger)age;

//打印当前对象的属性信息
- (void)printfInfo;


//类方法，使用类名调用此方法
+ (void)classMethod:(NSString *)s;

//创建一个Person对象
+ (Person *)createPerson;


@end

