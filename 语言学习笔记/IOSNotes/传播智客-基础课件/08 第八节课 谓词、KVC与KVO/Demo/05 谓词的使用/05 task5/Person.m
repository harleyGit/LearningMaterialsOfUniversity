//
//  Person.m
//  05 task5
//
//  Created by wei.chen on 13-8-6.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (id)personWithName:(NSString *)name andAge:(NSUInteger)age {
    Person *person = [[Person alloc] init];
    person.name = name;
    person.age = age;
    
    return [person autorelease];
}

- (void)dealloc {
    [_name release];
    [super dealloc];
}

- (NSString *)description {
    NSString *s = [NSString stringWithFormat:@"name=%@,age=%ld",_name,_age];
    return s;
}

@end
