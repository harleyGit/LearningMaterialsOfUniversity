//
//  NSString+Extension.h
//  task1
//
//  Created by wei.chen on 13-7-30.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)
//类目不能为类添加实例变量
/*
{
    NSString *name;
}
*/

- (BOOL)validateEmail;

@end
