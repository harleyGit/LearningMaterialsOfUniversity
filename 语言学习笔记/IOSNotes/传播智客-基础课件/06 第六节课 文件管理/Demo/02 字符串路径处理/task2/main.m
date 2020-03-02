//
//  main.m
//  task2
//
//  Created by wei.chen on 13-8-3.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //演示路径
        NSString *path = @"/Users/apple/file.text";
        NSLog(@"演示路径：%@",path);
        
        
        //1.返回路径的组成部分
        NSArray *array = [path pathComponents];
        NSLog(@"pathComponents:%@",array);
        
        //2.路径的最后组成部分
        NSString *lastComponent = [path lastPathComponent];
        NSLog(@"lastComponent:%@",lastComponent);
        
        //3.追加子路径
        NSString *newPath1 = [path stringByAppendingString:@"/appFile.text"];
        NSLog(@"newPath1=%@",newPath1);
        
        NSString *newPath2 = [path stringByAppendingPathComponent:@"appFile.text"];
        NSLog(@"newPath2=%@",newPath2);
        
        //4.删除最后的组成部分
        NSString *deleteLast = [path stringByDeletingLastPathComponent];
        NSLog(@"deleteLast:%@",deleteLast);
        
        //5.删除扩展名
        NSString *deleteExtension = [path stringByDeletingPathExtension];
        NSLog(@"deleteExtension:%@",deleteExtension);
        
        //6.获取路径最后部分的扩展名
        NSString *extension = [path pathExtension];
        NSLog(@"extension:%@",extension);
        
        //7.追加扩展名
        NSString *appendExt = [path stringByAppendingPathExtension:@"jpg"];
        NSLog(@"appendExt:%@",appendExt);
        
        
        //NSString ---> NSData
        NSString *s = @"tsdfsdfsdfsdf";
        NSData *data = [s dataUsingEncoding:NSUTF8StringEncoding];
        
        
        //NSData -———> NSString
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"str = %@",str);
        
        //NSMutableData 可变的Data对象，可以追加数据
        
    }
    return 0;
}

