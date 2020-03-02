//
//  main.m
//  03 task3
//
//  Created by wei.chen on 13-8-5.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        User *user1 = [[User alloc] init];
        user1.apples = [NSMutableArray arrayWithObjects:@"iphone",@"ipad", nil];
        user1.age = 20;
        
        //复制出来一个新的user对象
        User *user2 = [user1 copy];
        
        if (user1 != user2) {
            NSLog(@"user1 != user2");
            NSLog(@"user2.age=%d",user2.age);
            NSLog(@"user2.apples=%@",user2.apples);
        }
        
//        NSLog(@"user1.apples:%p",user1.apples);
//        NSLog(@"user2.apples:%p",user2.apples);
    
        [user2.apples addObject:@"ipod"];
    
        NSLog(@"user1=%@",user1.apples);
        NSLog(@"user2=%@",user2.apples);
    
        
    }
    return 0;
}

