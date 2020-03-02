//
//  main.m
//  2.DefinitionClass
//
//  Created by wei.chen on 13-7-23.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    
    
    
    /*
    //alloc在内存中申请一块内存区域，来存储对象的信息
    Person *person = [Person alloc];
    //调用init初始化一些数据
    person = [person init];
    */
    
    //两个步骤嵌套，创建了一个Person对象
    Person *person = [[Person alloc] init];
    
    //不推荐使用new方法，来创建一个对象
    //Person *person2 = [Person new];
    
    //id 可以表示所有类型的类，类似于void *
    //id person3 = [[Person alloc] init];
    //[person3 setAge:10];
    
    //调用购物的方法
    [person shopping];
    
    //调用设置名字的方法
    [person setName:@"zhangsan"];
    [person setAge:22];
    
    /*
    NSString *name = [person name];
    NSLog(@"姓名%@,年龄：%ld",name,[person age]);
     */
    
    //调用打印信息的方法
    [person printfInfo];
    
    //调用类方法
//    [Person classMethod:@"wxhl"];
    
    Person *p2 = [Person createPerson];
    
    NSLog(@"%@",p2);
    
    //给指针变量p3附上一个空指针地址
    Person *p3 = nil;
    [p3 setAge:24];
    
    return 0;
}

