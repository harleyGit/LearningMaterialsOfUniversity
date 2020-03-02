//
//  Person.m
//  02 task2
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"
#import "Dog.h"

@implementation Person

- (void)setName:(NSString *)name {
    _name = name;
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


@end
