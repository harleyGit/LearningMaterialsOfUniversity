//
//  Dog.m
//  task6
//
//  Created by wei.chen on 13-8-2.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (void)dealloc {
    NSLog(@"%@ Dog dealloc",self.name);
    [super dealloc];
}

@end
