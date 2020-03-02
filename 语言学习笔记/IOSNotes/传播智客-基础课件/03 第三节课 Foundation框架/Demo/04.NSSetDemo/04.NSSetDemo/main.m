//
//  main.m
//  04.NSSetDemo
//
//  Created by wei.chen on 13-7-29.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

NSInteger sortedArray(id obj1, id obj2, void * context) {
    NSString *s1 = obj1;
    NSString *s2 = obj2;
    
    //[s1 compare:<#(NSString *)#>];  比较的是字符中的ASIC码，“100”的ASIC码不一定比"99"大
    
    int v1 = [s1 intValue];
    int v2 = [s2 intValue];
    
    if (v1 > v2) {
        //返回降序
        return NSOrderedDescending;
    } else if(v1 < v2) {
        //返回升序
        return NSOrderedAscending;
    }
    
    return NSOrderedSame;
}

int main(int argc, const char * argv[])
{
    
    //数组的排序
    NSArray *array = @[@"100",@"45",@"233",@"11"];
    
    //使用函数指针进行排序
    //sortedArrayUsingFunction: 排序
//    NSArray *resultArray = [array sortedArrayUsingFunction:sortedArray context:@"demo1"];
    
//    NSLog(@"result:%@",resultArray);
    
    //使用block进行排序
    [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSString *s1 = obj1;
        NSString *s2 = obj2;
        
        //[s1 compare:<#(NSString *)#>];  比较的是字符中的ASIC码，“100”的ASIC码不一定比"99"大
        
        int v1 = [s1 intValue];
        int v2 = [s2 intValue];
        
        if (v1 > v2) {
            //返回降序
            return NSOrderedDescending;
        } else if(v1 < v2) {
            //返回升序
            return NSOrderedAscending;
        }
        
        return NSOrderedSame;
    }];
    
    
    
    
    //1.NSSet的创建
    NSString *s1 = @"zhangsan";
    NSString *s2 = @"lisi";
    NSSet *set1 = [[NSSet alloc] initWithObjects:s1,s2, nil];
    NSSet *set2 = [NSSet setWithObjects:s1,s2, nil];
    //把数组array中的所有元素，存储到set3中
    NSSet *set3 = [NSSet setWithArray:array];
    
    //2.NSSet转成数组
    NSArray *array1 = [set1 allObjects];
    
    //3.返回元素的个数
    NSUInteger count = [set1 count];
    
    //4.从容器中随机取出一个元素
    NSString *string1 = [set1 anyObject];
    
    //5.判断某一个对象是否在NSSet中
    BOOL isContains = [set1 containsObject:@"lisi"];
    
    //6.NSSet中不能重复存同一个对象
    
    //数组中是可以存取重复的对象
    NSString *str = @"jack";
    NSArray *array2 = [NSArray arrayWithObjects:str,str, nil];
    NSLog(@"%@",array2);
    
    //NSSet中不能重复存储相同的对象
    NSSet *set4 = [NSSet setWithObjects:str,str, nil];
    NSLog(@"%@",set4);
    
    /*
      NSSet与NSArray的区别
     1. 数组是有下标，NSSet是没有下标的
     2. 数组是有序的，NSSet是无序的
     3. 数组是可以重复存储同一个对象，NSSet反之，不能重复存储对象
    */
    
//    NSMutableSet 
    
    return 0;
}

