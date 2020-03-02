//
//  main.m
//  05 task5
//
//  Created by wei.chen on 13-8-6.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

void filter(NSArray *array,NSPredicate *predicate) {
    NSArray *filterArray = [array filteredArrayUsingPredicate:predicate];
    NSLog(@"filterArray=%@",filterArray);
    
}

/*
  谓词的使用
 */
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        
        NSArray *persons = [NSArray arrayWithObjects:
                            [Person personWithName:@"mac" andAge:20],
                            [Person personWithName:@"hate" andAge:25],
                            [Person personWithName:@"999ere" andAge:30],
                            [Person personWithName:@"aruse" andAge:28],
                            [Person personWithName:@"Erse" andAge:30],
                            [Person personWithName:@"Ahon" andAge:29],
                            [Person personWithName:@"Gose" andAge:30],
                            [Person personWithName:@"ate" andAge:20],
                            [Person personWithName:@"Iog" andAge:30],
                            [Person personWithName:@"小白" andAge:50],
                            [Person personWithName:@"小黑" andAge:30],
                            nil];
      
        /*
        //1.年龄小于30
        //定义谓词对象，谓词对象中包含了过滤条件
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"age<%d",30];
        
        //使用谓词条件过滤数组中的元素，过滤之后返回查询的结果
        NSArray *filterArray = [persons filteredArrayUsingPredicate:predicate];
        
        NSLog(@"filterArray=%@",filterArray);
        */
        
        //2.使用&&符号
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name='小白' && age>40"];
//        filter(persons,predicate);
        
        
        //3.IN(包含)
//        NSPredicate *predicate = [NSPredicate
//                                  predicateWithFormat:@"self.name IN {'小黑','Gose'} || self.age IN {30,50}"];
//        filter(persons,predicate);
        
        //4.以...开头
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name BEGINSWITH 'a'"];
//        filter(persons,predicate);
        
        //5.以...结尾
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name ENDSWITH 'se'"];
//        filter(persons,predicate);
        
        //6. 包含..字符
//        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name CONTAINS 'a'"];
//        filter(persons,predicate);
        
        //7.like  *：匹配任意多个字符   ?:表示一个字符
        /* 
          *a : 以a结尾的
          *a* : 字符串中含有a字符的
          ?a* : 第二个字符为a的
         */
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name like '?a*'"];
        filter(persons,predicate);
        
    }
    
    return 0;
}

