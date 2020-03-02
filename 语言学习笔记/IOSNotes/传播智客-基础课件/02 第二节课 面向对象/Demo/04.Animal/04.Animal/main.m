//
//  main.m
//  04.Animal
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rabbit.h"
#import "Tiger.h"

int main(int argc, const char * argv[])
{
    
    //创建兔子
    Rabbit *rabbit = [[Rabbit alloc] init];
    [rabbit eat];
    [rabbit sleep];
    
    //创建老虎
    Tiger *tiger = [[Tiger alloc] init];
    [tiger eat];
    [tiger sleep];
    
    return 0;
}

