//
//  Person.m
//  task6
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"

#define NAME @"name"
#define APPLES @"apples"
#define AGE @"age"

@implementation Person

//解归档时调用，解归档数据之后，会创建此对象，调用此初始化方法
- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super init];
    if (self != nil) {
        //解码
       _name = [[aDecoder decodeObjectForKey:NAME] copy];
        self.apples = [aDecoder decodeObjectForKey:APPLES];
        self.age = [aDecoder decodeIntegerForKey:AGE];
    }
    
    return self;
    
}


//归档时调用此方法
- (void)encodeWithCoder:(NSCoder *)aCoder {
    //将此对象的信息数据编码
    [aCoder encodeObject:_name forKey:NAME];
    [aCoder encodeObject:_apples forKey:APPLES];
    [aCoder encodeInteger:_age forKey:AGE];
    
}

//description 覆写NSObject的方法，NSLog打印此对象时，调用此方法
- (NSString *)description {
    NSString *string = [NSString stringWithFormat:@"name=%@,age=%ld,apples=%@",_name,_age,_apples];
    return string;
}


@end
