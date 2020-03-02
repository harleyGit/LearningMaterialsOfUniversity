//
//  Person.h
//  01 task1
//
//  Created by wei.chen on 13-8-6.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

@interface Person : NSObject {
@private
    NSString *_name;
    Dog *_dog;
    
    NSInteger _age;
}

- (void)setDog:(Dog *)dog;

@end
