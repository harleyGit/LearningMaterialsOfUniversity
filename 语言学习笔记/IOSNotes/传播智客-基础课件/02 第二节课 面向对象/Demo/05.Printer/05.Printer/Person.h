//
//  Person.h
//  05.Printer
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Printer.h"
//import "Printer.h"
//#import "ThreeDPrinter.h"
@interface Person : NSObject {
    NSString *_name;
}

/*
//使用彩色打印机
- (void)printWithColor:(ColorPrinter *)colorPrint;

//使用黑白打印机
- (void)printWithBlack:(BlackPrinter *)blackPrint;

//使用3D打印机的方法

//使用激光打印机的方法
*/

- (void)doPrint:(Printer *)printer;

@end
