//
//  AdressBook.m
//  task7
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "AdressBook.h"

static AdressBook *instacne = nil;

@implementation AdressBook

//获取单例对象的类方法
+ (AdressBook *)shareInstance {
    
    if (instacne == nil) {
        instacne = [[AdressBook alloc] init];
    }
    
    return instacne;
    
}

//限制方法，限制这个类只能创建一个对象
+ (id)allocWithZone:(NSZone *)zone {
    if (instacne == nil) {
        instacne = [super allocWithZone:zone];
    }
    return instacne;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return instacne;
}

- (oneway void)release {    
}

- (id)autorelease {
    return self;
}

- (NSUInteger)retainCount {
    return UINT_MAX;
}

@end
