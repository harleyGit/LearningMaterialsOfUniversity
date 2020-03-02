//
//  main.m
//  task7
//
//  Created by wei.chen on 12-12-13.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AudiCar.h"
#import "BMWCar.h"
#import "AutoCar.h"
#import "Person.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        AudiCar *audi = [[AudiCar alloc] init];
        BMWCar *bmw = [[BMWCar alloc] init];
        AutoCar *autoCar = [[AutoCar alloc] init];
        NSLog(@"请输入今天的天气：\n");
        NSLog(@"1.晴天\n");
        NSLog(@"2.雨天\n");
        NSLog(@"3.阴天\n");
        int wether;
        scanf("%d",&wether);
        
        Person *p = [[Person alloc] init];
        switch (wether) {
            case 1:
                //开动大众汽车
                [p runCar:autoCar];
                break;
            case 2:
                //开动宝马汽车
                [p runCar:bmw];
                break;
            case 3:
                //开动奥迪汽车
                [p runCar:audi];
                break;
            default:
                NSLog(@"天气输入错误");
                break;
        }
    }
    return 0;
}

