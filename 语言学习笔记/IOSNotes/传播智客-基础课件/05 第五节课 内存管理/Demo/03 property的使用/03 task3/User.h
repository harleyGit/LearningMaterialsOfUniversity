//
//  User.h
//  03 task3
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject {
  // NSString *_userName;
//    NSString *_password;
    //...
//    NSString *_userName;
}

/*
  @property的作用：
  1.生成_userName属性
  2.为_userName属性自动生成set\get方法
 */

//readonly： 不生成set方法， 只有get方法
@property (nonatomic,copy,readwrite)NSString *userName;  //注意括号里面的参数

- (void)showInfo;

@end
