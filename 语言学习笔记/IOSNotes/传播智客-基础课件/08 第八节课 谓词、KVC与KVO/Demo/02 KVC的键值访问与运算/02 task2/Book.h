//
//  Book.h
//  02 task2
//
//  Created by wei.chen on 13-8-6.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"

//书籍类
@interface Book : NSObject {
@private
    Author *_author;  //书的作者
}

@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign)float price;

@end
