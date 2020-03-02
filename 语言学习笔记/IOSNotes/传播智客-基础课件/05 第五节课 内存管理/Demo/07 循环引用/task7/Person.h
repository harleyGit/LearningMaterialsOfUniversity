//
//  Person.h
//  task7
//
//  Created by wei.chen on 13-8-2.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dog;
@interface Person : NSObject {
    Dog *_dog;
}

@property(nonatomic,retain)Dog *dog;

@end
