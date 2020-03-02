//
//  main.m
//  05.Printer
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ColorPrinter.h"
#import "BlackPrinter.h"
#import "Person.h"
#import "ThreeDPrinter.h"


int main(int argc, const char * argv[])
{

    Person *p = [[Person alloc] init];

/*
    ColorPrinter *colorPrint = [[ColorPrinter alloc] init];
    //使用彩色打印机
    [p printWithColor:colorPrint];
    
    BlackPrinter *blackPrint = [[BlackPrinter alloc] init];
    //使用黑白打印机
    [p printWithBlack:blackPrint];
*/
    
    /*
     狗 *d = [狗 alloc] init];
     动物 *d = [狗 alloc] init];
    */
    
    //创建彩色打印机
    Printer *colorPrinter = [[ColorPrinter alloc] init];
    [p doPrint:colorPrinter];
    
    //创建黑白打印机
    Printer *blackPrinter = [[BlackPrinter alloc] init];
    [p doPrint:blackPrinter];
    
    //创建3d打印机
    Printer *threePrinter = [[ThreeDPrinter alloc] init];
    [p doPrint:threePrinter];
    
    /*
      多态条件：
       1.要有继承
       2.要有方法覆写
       3.父类声明的引用，指向了子类对象
    */
    
    return 0;
}

