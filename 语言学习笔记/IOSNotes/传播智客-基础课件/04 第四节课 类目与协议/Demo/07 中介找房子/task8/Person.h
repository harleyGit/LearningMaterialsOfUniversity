//
//  Person.h
//  task8
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;
@protocol PersonDelegate <NSObject>

//找房子的协议方法
- (long)lookforApartme:(Person *)person;


@end


@interface Person : NSObject {
    NSString *_name;
    id<PersonDelegate> _delegate;
}

- (id)initWithDelegate:(id<PersonDelegate>)delegate;

//找房子
- (void)findHouse;

@end
