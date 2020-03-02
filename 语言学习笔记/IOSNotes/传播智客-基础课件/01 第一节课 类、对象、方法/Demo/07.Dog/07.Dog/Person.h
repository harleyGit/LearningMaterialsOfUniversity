//
//  Person.h
//  07.Dog
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject {
    NSString *_name;  //人的名字
    
    //NSString *_dogName;  //错误
    
    //狗和人两个类是聚合关系
    //使用Dog类声明一个狗
    Dog *_dog;
    
}

- (id)initName:(NSString *)name;

/*
  遛狗
  参数：时间值
 */
- (void)playDog:(int)time;

//狗的设置器方法
- (void)setDog:(Dog *)dog;

@end
