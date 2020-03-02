//
//  main.m
//  06.NSNumber_NSValue_Demo
//
//  Created by wei.chen on 13-7-29.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
/*_______________________________NSNumber的使用___________________________________*/
    
    //1.创建NSNumber(包装基本数据类型)
    NSNumber *intNumber = [NSNumber numberWithInt:100];
    NSNumber *floatNumber = [NSNumber numberWithFloat:9.8f];
    NSNumber *longNumber = [NSNumber numberWithLong:145677766666];
    NSNumber *boolNumber = [NSNumber numberWithBool:YES];
    
    NSArray *array = @[intNumber,floatNumber,longNumber,boolNumber];
    NSLog(@"array=%@",array);
    
    //2.解包
    int intValue = [intNumber intValue];
    float floatValue = [floatNumber floatValue];
    long longValue = [longNumber longValue];
    BOOL boolValue = [boolNumber boolValue];
    
    //3.新语法创建Number对象
    NSNumber *intNumber1 = @12;  //@"123";
    NSNumber *floatNumber1 = @12.0f;
    NSNumber *longValue1 = @19929292992;
    NSNumber *boolValue1 = @YES;
    NSNumber *charValue = @'a';
    
    
/*_______________________________NSValue的使用___________________________________*/
    
    struct WXPoint {
        float x;
        float y;
    };
    
    //1.创建NSValue(包装结构体), NSValue是NSNumber的父类
    //注意：结构体不是对象
    NSRange rang = {100,6};
    //NSRange封包
//    NSValue *rangValue = [NSValue valueWithRange:rang];
    //NSPoint封包
//    NSValue *pointValue = [NSValue valueWithPoint:<#(NSPoint)#>];
    
    //将自定义的结构体包装成NSValue对象
    struct WXPoint p = {50,100};
    NSValue *pointValue = [NSValue value:&p withObjCType:@encode(struct WXPoint)];
    
    //2.解包结构体
    struct WXPoint p2;
    [pointValue getValue:&p2];
    
    NSLog(@"x=%f,y=%f",p2.x,p2.y);
    
    
    //3.NSNull对象
    NSNull *n1 = [NSNull null];
    NSNull *n2 = [NSNull null];
    NSArray *arrayNull = @[n1,n2];
    NSLog(@"%@",arrayNull);
    
    for (id item in arrayNull) {
        
        //判断数组中的对象是否为一个NSNull对象，如果是，则过滤掉
        if (item == [NSNull null]) {
            continue;
        }
        
    }

    return 0;
}

