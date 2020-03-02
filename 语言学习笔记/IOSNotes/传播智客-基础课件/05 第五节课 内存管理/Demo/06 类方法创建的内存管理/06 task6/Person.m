//
//  Person.m
//  06 task6
//
//  Created by wei.chen on 13-8-2.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (id)personWithName:(NSString *)name {
    
    //此处的self不是指向当前对象，而是指向Person类
    Person *person = [[self alloc] init]; //等价于[[Person alloc] init];
    person->_name = name;

    return [person autorelease];
    
}

- (void)dealloc {
    NSLog(@"Person dealloc");
    [super dealloc];
}

@end
