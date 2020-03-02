//
//  Author.h
//  02 task2
//
//  Created by wei.chen on 13-8-6.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

//作者类 --> 书籍1、书籍2、书籍3
@interface Author : NSObject {
@private
    NSString *_name;

    //作者出版的书
    NSArray *_issueBook;
}

@end
