//
//  Person.m
//  05.Printer
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"

@implementation Person

/*
- (void)printWithColor:(ColorPrinter *)colorPrint {
    //调用彩色打印机的打印方法
    [colorPrint print];
}

//使用黑白打印机
- (void)printWithBlack:(BlackPrinter *)blackPrint {
    //调用黑白打印机的打印方法
    [blackPrint print];
}
*/

- (void)doPrint:(Printer *)printer {
    [printer print];
}

@end
