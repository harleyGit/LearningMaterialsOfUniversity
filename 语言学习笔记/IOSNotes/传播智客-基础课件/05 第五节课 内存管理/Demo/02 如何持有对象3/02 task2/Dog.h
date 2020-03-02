//
//  Dog.h
//  02 task2
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject {
    NSString *_name;
}

- (void)setName:(NSString *)name;
- (NSString *)name;

@end
