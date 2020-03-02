//
//  AdressBook.h
//  task7
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

//设计单例类的目的：限制这个类只能创建一个对象

/*
 单例的应用场景：
  1.单例对象可以存储一些共享的信息，每个对象都能访问和修改
  2.如果一个类的创建非常的耗费性能，那么这个类最好设计为单例，只创建一次节约性能
 */

@interface AdressBook : NSObject<NSCopying>

@property(nonatomic,copy)NSString *phone;

+ (AdressBook *)shareInstance;


@end
