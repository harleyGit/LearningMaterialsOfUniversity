//
//  Student.h
//  08.Import
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "Classes.h"

/*
 @class可以解决相互导入
 @class仅仅是告诉编译器其他地方已经定义了这样一个类，
 至于这个类是如何定义的，有哪些方法、属性，当前文件是不知道的
*/
@class Classes;

@interface Student : NSObject {
    Classes *clas;  //所属的班级
}

- (void)study;



@end
