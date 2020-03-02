//
//  Person.h
//  task6
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

//类只有实现NSCoding协议，才具备归档功能
@interface Person : NSObject<NSCoding>

@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)NSInteger age;
@property(nonatomic,retain)NSArray *apples;

@end
