//
//  NSString+Extension.m
//  task3
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

//@"abcdef" --> @"fedcba"
- (NSString *)sortString {
    
    NSMutableString *newString = [NSMutableString string];
    
    for (long i=self.length-1; i>=0; i--) {
        unichar c = [self characterAtIndex:i];
        
        [newString appendFormat:@"%c",c];
    }
    
    return newString;
    
}

@end
