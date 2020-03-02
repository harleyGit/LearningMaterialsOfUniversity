//
//  Book.m
//  Book
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Book.h"

@implementation Book

//自定义初始化方法
- (id)initWithTitle:(NSString *)title withPageNum:(NSInteger)pageNum {
    self = [super init];
    
    if (self != nil) {
        _title = title;
        _pageNum = pageNum;
    }
    
    return self;
}

- (void)showDetail {
    NSLog(@"书名：%@,页数:%ld",_title,_pageNum);
}
//- (NSString *)showDetail {
//    NSString *s = @"书名：wxhl, 页数:10000";
//    return s;
//}

//修改书名和页数
- (void)setTitle:(NSString *)title pageNum:(NSInteger)pageNum {
    _title = title;
    _pageNum = pageNum;
}


//设置器
- (void)setTitle:(NSString *)title {
    _title = title;
}

//访问器
- (NSString *)title {
    return _title;
}


@end
