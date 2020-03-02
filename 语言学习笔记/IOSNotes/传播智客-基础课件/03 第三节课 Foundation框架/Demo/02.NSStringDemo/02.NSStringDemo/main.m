//
//  main.m
//  02.NSStringDemo
//
//  Created by wei.chen on 13-7-27.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    
/*_________________________NSString(不可变字符串)___________________________*/
    
        //---------------(1)字符串创建--------------------//
    //创建一个字符串常量
    NSString *string1 = @"hello";
    string1 = @"hello world";
    NSLog(@"%@",string1);
    
    //创建字符串
    NSString *string2 = [[NSString alloc] initWithString:@"hello"];
    //initWithFormat：多个字符串拼接
    NSString *string3 = [[NSString alloc] initWithFormat:@"hello %@",string2];
    NSLog(@"string2 = %@",string2);
    NSLog(@"string3 = %@",string3);
    
    NSString *ss1 = [[NSString alloc] initWithFormat:@"ZHANGsan"];
    NSString *ss2 = [[NSString alloc] initWithFormat:@"zhangsan"];
    NSLog(@"[ss1 caseInsensitiveCompare:ss2]:%ld",[ss1 caseInsensitiveCompare:ss2]);
    
    //创建空的字符串
    NSString *string4 = [[NSString alloc] init]; //等价于string4 = @"";
    
    //stringWithFormat：使用类方法创建字符串对象
    //NSString *string5 = [NSString stringWithString:@"hello"];  //等价于string5 = @"hello";
    NSString *string6 = [NSString stringWithFormat:@"hello %@",@"world"];
    
    //使用格式化符拼接数值
    int number = 101;
    NSString *string7 = [NSString stringWithFormat:@"class:%d",number];
    NSLog(@"string7=%@",string7);
    
    //---------------(2)字符串的比较--------------------//
    NSString *s0 = @"无限互联";
//    NSString *s11 = @"无限互联";   //s0与s11的指针地址是一样的，指向的都是常量区同一个字符串对象
    
    NSString *s1 = [NSString stringWithFormat:@"无限互联"];
    NSString *s2 = [[NSString alloc] initWithFormat:@"无限互联"];
    //判断s1与s2的指针地址是否相等
    if (s0 == s2) {   //不相等，因为是两个对象，指针地址不一样
        NSLog(@"s0 == s2");
    }
    
    //isEqualToString: 是比较两个字符串内容是否相同
    if ([s0 isEqualToString:s2]) {
        NSLog(@"s0与s2的字符串内容相同");
    }
    NSObject *obj1;
    NSObject *obj2;

    NSString *string8 = @"a";
    NSString *string9 = @"A";
    //compare: 比较字符串的大小
    NSComparisonResult result = [string8 compare:string9];
    if (result == NSOrderedAscending) { //结果为升序
        NSLog(@"string8 < string9");
    } else if(result == NSOrderedSame) {
        NSLog(@"string8 string9 内容一样");
    } else if(result == NSOrderedDescending) {
        NSLog(@"string8 > string9");
    }
    
    //---------------(3)字符串的其他用法--------------------//
    //length: 获取字符串的长度
    NSString *string10 = @"abcdef";
    NSInteger len = [string10 length];
    NSLog(@"len = %ld",len);
    
    NSString *string11 = @"hELlo";
    //uppercaseString:将字符串中的字母转成大写
    NSLog(@"upper:%@",[string11 uppercaseString]);
    //uppercaseString
    NSLog(@"lower:%@",[string11 lowercaseString]);
    //capitalizedString:首字母大写,其他字母小写
    NSLog(@"capitalized:%@",[string11 capitalizedString]);
    
    //将字符串转成基本数据类型
    NSString *string12 = @"3.14";
    //float f = (float)string12;  //错误
    //floatValue:字符串中是一个浮点数值转成float
    float f = [string12 floatValue];
    NSLog(@"floatValue:%f",f);
    
    NSString *string13 = @"1";
    BOOL bo = [string13 boolValue];  //true
    
    //---------------(4)字符串截取--------------------//
    NSString *string14 = @"abcdef";
     //---------------(4)字符串截取--------------------//
    NSString *substring1 = [string14 substringToIndex:3];
    NSLog(@"substringToIndex:%@",substring1);
    
    //substringFromIndex:从指定索引位置开始截取到末尾，包含指定的索引
    NSString *substring2 = [string14 substringFromIndex:1];
    NSLog(@"substringFromIndex:%@",substring2);
    
    NSRange rang = {2,3};  //2:指定位置  3:需要截取的长度
    //substringWithRange:截取指定范围的字符串
    NSString *substring3 = [string14 substringWithRange:rang];
    NSLog(@"substringWithRange:%@",substring3);
    
    
    //---------------(5)拼接字符串--------------------//
    NSString *str1 = @"Hello";
    NSString *str2 = @"World";
    NSString *str3 = @"OC!";
    NSString *string15 = [NSString stringWithFormat:@"%@-%@-%@",str1,str2,str3];
    NSLog(@"string15:%@",string15);
    
    //字符串追加
    NSString *string16 = [string15 stringByAppendingString:@"-iOS"];
    NSString *string17 = [string15 stringByAppendingFormat:@"%@,%@",@"iOS",@"iPhone"];
    NSLog(@"string16:%@",string16);
    NSLog(@"string17:%@",string17);
    
    //字符串追加
    NSString *link = @"www.iphonetrain.com/.html";
    //rangeOfString:查找字符串所在的位置
    NSRange linkRang = [link rangeOfString:@"html"];
    if (linkRang.location != NSNotFound) {
        NSLog(@"location:%ld,length:%ld",linkRang.location,linkRang.length);
    }
    
    //例如：能查找到@163.com，说明此邮箱是网易邮箱
    //NSString *email = @"12345@163.com";
    
/*___________________________NSMutableString(不可变字符串)__________________________*/

    //NSMutableString *mutableString1 = @"string";  错误
    
    NSMutableString *mutableString1 = [[NSMutableString alloc] initWithFormat:@"字符串"];
    //insertString: 在原有的字符串基础上插入字符串
    [mutableString1 insertString:@"可变" atIndex:0];
    NSLog(@"mutableString1:%@",mutableString1);
    
    NSMutableString *mutableString2 = [NSMutableString stringWithFormat:@"字符符符串"];
    //rangeOfString:查找指定字符串所在的范围
    NSRange rang3 = [mutableString2 rangeOfString:@"符符"];
    //deleteCharactersInRange:根据范围删除指定的字符串
    [mutableString2 deleteCharactersInRange:rang3];
    NSLog(@"mutableString2:%@",mutableString2);
    
    NSMutableString *mutableString3 = [NSMutableString stringWithFormat:@"字符串"];
    NSRange rang4 = [mutableString3 rangeOfString:@"字符"];
    //replaceCharactersInRange:withString:  字符串替换
    [mutableString3 replaceCharactersInRange:rang4
                                  withString:@"羊肉"];
    NSLog(@"mutableString3:%@",mutableString3);
    
    
    return 0;
}

