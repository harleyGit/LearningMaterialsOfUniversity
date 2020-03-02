//
//  main.m
//  08.Rectangle
//
//  Created by wei.chen on 13-7-24.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rectangle.h"

int main(int argc, const char * argv[])
{    float height;
    
    NSLog(@"请输入宽：");
    scanf("%f",&width);
    
    NSLog(@"请输入高：");
    scanf("%f",&height);

    float width;

    
    Rectangle *rect = [[Rectangle alloc] initWithWidth:width withHeight:height];
    
    //调用计算面积的方法
    float area = [rect countArea];
    
    //调用计算周长的方法
    float girth = [rect countGirth];
    
    NSLog(@"面积：%0.2f,周长：%0.2f",area,girth);
    
    return 0;
}

