//
//  Student.h
//  Task2
//
//  Created by wei.chen on 13-7-29.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

//姓名	年龄	分数	班级
@interface Student : NSObject
{
    NSString *_name;    //姓名
    NSUInteger _age;   //年龄
    float _score;       //分数
    NSString *_classesName;   //班级
}

- (void)setName:(NSString *)name;
- (void)setAge:(NSUInteger)age;
- (void)setScore:(float)score;
- (void)setClassesName:(NSString *)classesName;


- (float)score;
- (NSString *)classesName;
- (NSString *)name;

@end
