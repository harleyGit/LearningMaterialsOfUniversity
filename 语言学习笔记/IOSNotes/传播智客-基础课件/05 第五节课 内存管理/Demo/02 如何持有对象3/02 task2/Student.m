//
//  Student.m
//  02 task2
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)setCode:(NSString *)code {
    if (_code != code) {
        [_code release];
        _code = [code copy];
    }
}

- (void)dealloc {
    [_code release];
    
    NSLog(@"Student dealloc");
    
    //调用父类的dealloc,让父类释放所持有的对象
    [super dealloc];
}

@end
