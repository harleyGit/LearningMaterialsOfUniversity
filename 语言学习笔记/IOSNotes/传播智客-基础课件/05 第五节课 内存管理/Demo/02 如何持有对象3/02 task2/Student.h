//
//  Student.h
//  02 task2
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"

@interface Student : Person {
    NSString *_code;
}

- (void)setCode:(NSString *)code;

@end
