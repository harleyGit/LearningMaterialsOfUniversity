//
//  Student.m
//  Task2
//
//  Created by wei.chen on 13-7-29.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)setName:(NSString *)name {
    _name = name;
}
- (void)setAge:(NSUInteger)age {
    _age = age;
}
- (void)setScore:(float)score {
    _score = score;
}
- (void)setClassesName:(NSString *)classesName {
    _classesName = classesName;
}

- (float)score {
    return _score;
}

- (NSString *)classesName {
    return _classesName;
}

- (NSString *)name {
    return _name;
}

@end
