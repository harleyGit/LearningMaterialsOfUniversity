//
//  Person.m
//  02 task2
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"
#import "Dog.h"

/*
  1.给全局对象赋值的时候，需要将此对象retain
  2.在dealloc中对全局的对象都release
 */

@implementation Person

//自定义初始化方法
- (id)initWithDog:(Dog *)dog {
    self = [super init];
    if (self != nil) {
        _dog = [dog retain];
    }
    return self;
}


- (void)setName:(NSString *)name {
    if (_name != name) {
        [_name release];
        _name = [name copy];
    }
}


//第一种形式
//- (void)setDog:(Dog *)dog {
//    _dog = [dog retain];
////    [_dog retain];
//}

//第二种形式
//- (void)setDog:(Dog *)dog {
//    [_dog release];
//    _dog = [dog retain];
//}

//第三种形式
- (void)setDog:(Dog *)dog {
    if (_dog != dog) {
        [_dog release];
        _dog = [dog retain];
    }
}

- (Dog *)dog {
    return _dog;
}

//遛狗
- (void)playDog {
    NSLog(@"遛狗：%@",_dog.name);
}


- (void)dealloc {
    
    [_dog release];  //释放持有狗的对象所有权
    [_name release];
    
    NSLog(@"Person dealloc");
    [super dealloc];
}

@end
