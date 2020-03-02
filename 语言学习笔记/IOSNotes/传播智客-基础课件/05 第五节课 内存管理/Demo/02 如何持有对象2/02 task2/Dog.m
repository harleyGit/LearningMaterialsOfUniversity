//
//  Dog.m
//  02 task2
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (void)setName:(NSString *)name {
    _name = name;
}

- (NSString *)name {
    return _name;
}

- (void)dealloc {
    NSLog(@"Dog dealloc");
    [super dealloc];
}

@end
