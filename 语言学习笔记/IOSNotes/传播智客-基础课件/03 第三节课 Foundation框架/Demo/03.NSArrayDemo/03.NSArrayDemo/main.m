//
//  main.m
//  03.NSArrayDemo
//
//  Created by wei.chen on 13-7-27.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
/*_________________________不可变数组(NSArray)_______________________________*/
    
    //---------------------1.数组的创建--------------------------//
    NSString *s1 = @"zhangsan";
    NSString *s2 = @"lisi";
    NSString *s3 = @"wangwu";
    
    NSArray *array1 = [[NSArray alloc] initWithObjects:s1,s2,s3, nil];
    NSLog(@"%@",array1);
    
    //类方法创建，注意：最后以nil结尾。
    NSArray *array2 = [NSArray arrayWithObjects:s1,s2,s3, nil];
    //初始一个元素对象
    NSArray *array3 = [NSArray arrayWithObject:s1];
    
    //创建一个数组，此数组中的元素来自array1
    NSArray *array4 = [NSArray arrayWithArray:array1];
    
    //---------------------2.通过下标取元素--------------------------//
    NSString *str1 = [array4 objectAtIndex:0]; 
    NSLog(@"str1 = %@",str1);
    
    //---------------------3.数组的元素个数--------------------------//
    NSUInteger count = [array4 count];
    NSUInteger count2 = array4.count;  //点语法等价于-> [array4 count];//注意count是不能带参数
    NSLog(@"count2 = %ld",count2);
    
    //---------------------4.判断是否包含某个对象--------------------------//
    BOOL isContains = [array4 containsObject:@"zhangsan"];
    NSLog(@"isContains: %d",isContains);
    
    //---------------------5.对象在数组中的索引位置--------------------------//
    NSUInteger index = [array4 indexOfObject:@"wangwu"];
    NSLog(@"index = %ld",index);
    
    //---------------------6.链接数组中的字符串--------------------------//
    //注意：数组中的元素必须都是字符串，才可以使用此方法
    NSString *joinString = [array4 componentsJoinedByString:@","];
    NSLog(@"join:%@",joinString); //zhangsan,lisi,wangwu
    
    //---------------------7.访问最后一个元素--------------------------//
    NSString *last = [array4 lastObject]; //等价于点语法：array4.lastObject;
    NSLog(@"last:%@",last);
    
    //---------------------8.在原来的数组上追加对象--------------------------//
    //追加之后，创建了一个新的数组
    NSArray *array5 = [array4 arrayByAddingObject:@"zhaoliu"];
    NSLog(@"array5:%@",array5);
    
    /*
     注意：1.数组中不能存放基本数据类型，只能存放对象
          2.数组越界
     */
//    NSArray *array6 = [NSArray arrayWithObject:100];  //错误，基本数据类型不能存放到数组中
    
    int idx = 4;
    if (idx < array5.count) {  //严谨的写法，只有下标小于元素个数时，才可以使用下标取元素
        [array5 objectAtIndex:idx];
    }
    
    
    //---------------xcode4.4以后对数组的创建和访问，语法上做了优化---------------//
    //1.创建一个数组
    NSArray *array7 = @[s1,s2,s3];
    //等价于NSArray *array2 = [NSArray arrayWithObjects:s1,s2,s3, nil];
    NSLog(@"array7=%@",array7);
    
    NSString *str = array7[0];
    NSLog(@"array7[0] = %@",str);
    
    
/*_________________________可变数组(NSMutableArray)_______________________________*/

    NSString *t1 = @"zhangsan";
    NSString *t2 = @"lisi";
    NSString *t3 = @"wangwu";
    
    //---------------------1.创建可变数组--------------------------//
    NSMutableArray *marray1 = [[NSMutableArray alloc] initWithObjects:t1,t2,t3, nil];
    
    //创建数组时，开辟3个空间来存储元素，当存储的元素超过3个时，系统会自动增大此数组的空间
    NSMutableArray *marray2 = [[NSMutableArray alloc] initWithCapacity:3];
    NSMutableArray *marray3 = [NSMutableArray arrayWithCapacity:3];
    
    //新语法创建的是不可变数组
//    NSMutableArray *marray4 = @[s1,s2,s3];  //错误
    
    //---------------------2.添加元素--------------------------//
    [marray2 addObject:s1];
    [marray2 addObject:s2];
    [marray2 addObject:s3];
    
    //将marray2中所有的元素全都添加到marray3中
    //[marray3 addObjectsFromArray:marray2];
    
    //这是marray2添加到marray3中，marray3则是个二维数组
    //[marray3 addObject:marray2];
    
    
    //---------------------3.插入元素--------------------------//
    [marray2 insertObject:@"赵六" atIndex:0];
    NSLog(@"marray2 = %@",marray2);
//    [marray2 insertObject:@"zhaoliu" atIndex:0];  //错误，数组越界
    
    //---------------------4.替换元素--------------------------//
    [marray2 replaceObjectAtIndex:1 withObject:@"zhangfei"];
    NSLog(@"marray2 = %@",marray2);
    
    //---------------------5.互换两个元素的位置--------------------------//
    [marray2 exchangeObjectAtIndex:3 withObjectAtIndex:2];
    NSLog(@"marray2 = %@",marray2);
    
    //---------------------6.将另外一个数组的所有元素添加到当前数组--------------------------//
    [marray3 addObjectsFromArray:marray2];
    
    //---------------------7.删除元素--------------------------//
/*
    //7.1根据下标删除
    [marray2 removeObjectAtIndex:0];
    NSLog(@"marray2 = %@",marray2);
    
    //7.2根据对象删除
    [marray2 removeObject:@"zhangfei"];
    NSLog(@"marray2 = %@",marray2);    
    
    //7.3删除最后一个元素
    [marray2 removeLastObject];
    NSLog(@"marray2 = %@",marray2);    
    
    //7.4删除所有元素
    [marray2 removeAllObjects];
    NSLog(@"marray2 = %@",marray2);    
 */
    
    //---------------------遍历数组--------------------------//
    //1.普通遍历
    /*
    for (int i=0; i<marray2.count; i++) {
        NSString *str = [marray2 objectAtIndex:i];
       // NSString *str2 = marray2[i];
        NSLog(@"%@",str);
    }
     */
    
    //2.快速遍历
    for (NSString *s in marray2) {
        NSLog(@"%@",s);
    }
    
    return 0;
}

