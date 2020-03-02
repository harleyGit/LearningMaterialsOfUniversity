//
//  main.m
//  05.NSDictionayDemo
//
//  Created by wei.chen on 13-7-29.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
/*________________________不可变字典(NSDictonary)___________________________*/
    
    //1.字典的创建
    NSArray *array1 = [NSArray arrayWithObjects:@"zhangsan",@"zhangfei", nil];
    NSArray *array2 = [NSArray arrayWithObjects:@"lisi",@"liping", nil];
    
    //第一个元素：key:@“zhang”  value:array1
    //第二个元素：key:@"li"     value:array2
    NSDictionary *dic1 = [[NSDictionary alloc] initWithObjectsAndKeys:array1,@"zhang",array2,@"li", nil];
    NSUInteger count = [dic1 count];
    NSLog(@"count:%ld",count);
    
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:array1,@"zhang",array2,@"lisi", nil];
    
    //创建字典时，初始化了一个元素
    NSDictionary *dic3 = [NSDictionary dictionaryWithObject:array1 forKey:@"zhangsan"];
    
    //2.获取字典中元素的个数
    NSUInteger count2 = [dic1 count];
    
    //3.获取字典中所有的key
    NSArray *allkeys = [dic1 allKeys];
    NSLog(@"allkeys:%@",allkeys);
    
    //4.获取字典中所有的value
    NSArray *allvalues = [dic1 allValues];
    NSLog(@"allvalues:%@",allvalues);
    
    //5.通过key取得value
    NSArray *array3 = [dic1 objectForKey:@"zhang"];
    NSLog(@"array3:%@",array3);
        
/*________________________字典的新语法___________________________*/
    
    //创建的语法：{"key1":"value1","key2":"value2"};
    //新语法创建字典
    NSDictionary *dic4 = @{@"zhang":array1,@"li":array2};
    NSLog(@"dic4:%@",dic4);
    
    //取value的语法：字典["key"]
    NSArray *array4 = dic4[@"zhang"];
    NSLog(@"array4:%@",array4);
    
    //使用字典存储一个工人的信息
    /*
     {
        "name": "zhangsan", //工人的姓名
        "age" : "22"        //工人的年龄
        ...
      }
     */
    NSDictionary *worker = [NSDictionary dictionaryWithObjectsAndKeys:@"zhangsan",@"name",@"23",@"age", nil];
    
    
/*________________________可变字典(NSMutableDictionary)___________________________*/

    //1.创建一个可变的数组
    NSMutableDictionary *mdic1 = [[NSMutableDictionary alloc] initWithCapacity:3];
    NSMutableDictionary *mdic2 = [NSMutableDictionary dictionaryWithCapacity:3];
    
    //2.添加元素
    [mdic1 setObject:array1 forKey:@"zhang"];
    [mdic1 setObject:array2 forKey:@"li"];
    
    //将字典dic1中的元素添加到此字典中
    [mdic1 addEntriesFromDictionary:dic1];  //注意：相同的key是不能重复添加到字典中
    
    NSLog(@"mdic1:%@",mdic1);
    
    //3.删除
    //根据key删除元素
//    [mdic1 removeObjectForKey:@"zhang"];
    
    //删除多个元素
//    [mdic1 removeObjectsForKeys:@[@"zhang",@"li"]];
//    NSLog(@"mdic1:%@",mdic1);
    
    //删除所有的元素
    //[mdic1 removeAllObjects];
    
    
    //1.第一种方式
    /*
    for (NSString *key in mdic1) {
        NSArray *names = [mdic1 objectForKey:key];
        NSLog(@"names:%@",names);
    }
     */
    
    //2.第二种方式
    /*
    NSArray *keys = [mdic1 allKeys];
    for (int i=0; i<keys.count; i++) {
        NSString *key = [keys objectAtIndex:i];
        NSArray *names = [mdic1 objectForKey:key];
        NSLog(@"names:%@",names);
    }
     */
    
    //3.第三种方式
    //获取枚举对象，枚举对象中存储的是字典里所有的key
    NSEnumerator *enumer = [mdic1 keyEnumerator];
    
    //让枚举对象的游标指向下一个对象
    id key = [enumer nextObject];
    while (key != nil) {
        
        NSArray *names = [mdic1 objectForKey:key];
        NSLog(@"names:%@",names);
        
        key = [enumer nextObject];
    }
    
    
    //数组也可以使用枚举对象遍历
    /*
    NSArray *array = [NSArray array];
    NSEnumerator *enumer2 = [array objectEnumerator];
    */
    
/*________________________字典排序___________________________*/
    
    NSDictionary *sortDic = @{
                                @"zhangsan":@"50",
                                @"lisi":@"90",
                                @"wangwu":@"80",
                                @"zhao6":@"60"
                            };
    
    //对字典中的value进行排序，参数obj1,obj2 是字典中的value
    //返回值是排好序的key
    NSArray *sortedKeys = [sortDic keysSortedByValueUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        
        int v1 = [obj1 intValue];
        int v2 = [obj2 intValue];
        
        if (v1 > v2) {
            return NSOrderedDescending;
        } else if(v1 < v2) {
            return NSOrderedAscending;
        }
        
        return NSOrderedSame;
        
    }];
    
    for (NSString *name in sortedKeys) {
        NSString *score = [sortDic objectForKey:name];
        NSLog(@"name:%@,score:%@",name,score);
    }
    
    return 0;
}

