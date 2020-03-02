//
//  Person.h
//  05 task5
//
//  Created by wei.chen on 13-8-6.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSUInteger age;

+ (id)personWithName:(NSString *)name andAge:(NSUInteger)age;

@end
