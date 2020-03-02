//
//  Person.m
//  task7
//
//  Created by wei.chen on 13-8-2.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"
#import "Dog.h"

@implementation Person

- (void)dealloc {
    NSLog(@"Person dealloc");
    [_dog release];
    [super dealloc];
}

@end
