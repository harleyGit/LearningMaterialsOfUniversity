//
//  main.m
//  06.Instrument
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Piano.h"
#import "Actor.h"
#import "Violin.h"

int main(int argc, const char * argv[])
{
    Piano *piano = [[Piano alloc] init];
    Violin *violin = [[Violin alloc] init];
    
    Actor *actor = [[Actor alloc] init];
    NSLog(@"请选择演奏家要使用的乐器：");
    NSLog(@"1.钢琴， 2.小提琴");
    
    int code;
    scanf("%d",&code);
    if (code == 1) {
        [actor doPlay:piano];
    } else if(code == 2) {
        [actor doPlay:violin];
    } else {
        NSLog(@"没有此乐器");
    }
    

    return 0;
}

