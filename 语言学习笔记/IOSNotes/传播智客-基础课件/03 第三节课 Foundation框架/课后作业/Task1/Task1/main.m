//
//  main.m
//  Task1
//
//  Created by wei.chen on 13-7-29.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Worker.h"

/*
   作业
 */
int main(int argc, const char * argv[])
{
    //1.构建一个数组，含有100个1~100的整数，并且用不同的方式将它们遍历出来。
    
    NSArray *array = [NSMutableArray arrayWithCapacity:100];
    for (int i=1; i<=100; i++) {
        NSNumber *number = [NSNumber numberWithInt:i];
        [array addObject:number];
    }
    
    /*
    for (int i=0; i<array.count; i++) {
        NSNumber *number = [array objectAtIndex:i];
        //NSLog(@"%@",number);
        int value = [number intValue];
        NSLog(@"%d",value);
    }
    */
    
    /*
    for (NSNumber *number in array) {
        NSLog(@"%@",number);
    }
    */
    
    //2.
    /*
     zhang3	18	5500
     li4	25	8000
     wang5	22	7000
     
     （2）在li4 之前插入一个工人，信息为：“姓名：zhao6，年龄：24，工资3300”
     （3）删除wang5的信息
     （4）利用for 循环遍历，打印List 中所有工人的信息
     （5）利用迭代遍历，对List 中所有的工人调用work 方法。
     */
    
    Worker *w1 = [[Worker alloc] init];
    [w1 setName:@"zhang3"];
    [w1 setAge:18];
    [w1 setMoney:5500];
    
    Worker *w2 = [[Worker alloc] init];
    [w2 setName:@"li4"];
    [w2 setAge:25];
    [w2 setMoney:8000];

    Worker *w3 = [[Worker alloc] init];
    [w3 setName:@"wang5"];
    [w3 setAge:22];
    [w3 setMoney:7000];
    
    NSMutableArray *workers = [NSMutableArray arrayWithObjects:w1,w2,w3, nil];
    Worker *w4 = [[Worker alloc] init];
    [w4 setName:@"zhao6"];
    [w4 setAge:24];
    [w4 setMoney:3300];
    

    NSLog(@"%@",workers);
    //计算w2对象在数组中所在索引位置
    NSUInteger index = [workers indexOfObject:w2];
    //将w4插入到w2所在的位置，那么w2会自动的往后移动
    [workers insertObject:w4 atIndex:index];
    
    NSLog(@"%@",workers);
//    NSLog(@"%@",w4); //等价于NSLog(@"%@",[w4 description]);
    
    //删除w3对象
    [workers removeObject:w3];
    NSLog(@"%@",workers);
    
    for (Worker *w in workers) {
        //NSLog(@"%@",w);
        
        [w work];
    }
    
    
    return 0;
}

