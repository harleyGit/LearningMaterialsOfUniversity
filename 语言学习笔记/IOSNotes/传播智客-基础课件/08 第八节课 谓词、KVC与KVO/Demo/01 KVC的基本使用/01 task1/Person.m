//
//  Person.m
//  01 task1
//
//  Created by wei.chen on 13-8-6.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"

@implementation Person

- (NSString *)description {
    NSString *s = [NSString stringWithFormat:@"name=%@,age=%ld",_name,_age];
    return s;
}

- (void)setDog:(Dog *)dog {
    if (_dog != dog) {
        [_dog release];
        _dog = [dog retain];
    }
    
    NSLog(@"setDog");
}

@end
