//
//  Person.h
//  01.Person
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 封装
 将age私有化以后，类以外即使创建了对象也不能直接访问，
 但是人应该有年龄，就需要在Person类中提供对应访问age的方式。
 */

/*
 注意：私有仅仅是封装的一种表现形式
 */

/*
 凡是set方法，一般返回值是void
 参数一定至少有一个
 
 凡是get方法, 返回值一定有类型
 */


@interface Person : NSObject {
    
    //描述一下人这个事物
    
//@public
@private //私有修饰符(权限修饰符中的一种)，用法是用于修饰类中的实例变量，只能本类中有效。
    int _age;
}

- (void)setAge:(int)age;
- (int)age;

@end
