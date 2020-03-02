//
//  main.m
//  02.Car
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Truck.h"
#import "Taxi.h"

/*
  继承：
   1.提高代码的复用性
   2.让类与类之间产生了关系，有了这个关系，才有了多态的特性
 
   注意：
   1.千万不要为了获取其他类的功能，而简化代码而继承
   2.必须是类与类之间有所属关系才可以继承，所属关系：is a
 
   OC不支持多继承的，只支持单继承。
   因为多继承容易带来安全隐患：当多个父类定义了相同的功能，当功能内容不同时，不确定运行哪一个。
 
   OC是支持多层继承，也就是一个继承体系

*/



int main(int argc, const char * argv[])
{

    //创建卡车类
   
    Truck *t = [[Truck alloc] init];
    [t setBrand:@"东风"];
    [t setColor:@"红色"];
  
    [t brake];  //父类继承下来的刹车方法
    [t quicken];    //父类继承下来的加速方法
    
    //自己特有的方法：卸货
    [t unload];
  
    
    
    Taxi *t2 = [[Taxi alloc] init];
    t2.brand = @"现代";
    t2.color = @"黑色";
    
    [t2 brake];  //刹车
    [t2 printTick]; //打印发票
    
    
    return 0;
}

