//
//  User.h
//  03 task3
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject<NSCopying>

@property(nonatomic,retain)NSMutableArray *apples; //拥有的苹果设备
@property(nonatomic,assign)int age;

@end
