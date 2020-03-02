//
//  Book.h
//  Book
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

//书籍类
@interface Book : NSObject {
    NSString *_title;       //书名
    NSInteger _pageNum;     //页数
    
//    float _price;
//    NSString *_owner;
}


//自定义初始化方法
- (id)initWithTitle:(NSString *)title withPageNum:(NSInteger)pageNum;

//显示打印书籍的信息
- (void)showDetail;
//- (NSString *)showDetail;

//修改书名和页数
- (void)setTitle:(NSString *)title pageNum:(NSInteger)pageNum;


//设置器
- (void)setTitle:(NSString *)title;
//访问器
- (NSString *)title;

@end
