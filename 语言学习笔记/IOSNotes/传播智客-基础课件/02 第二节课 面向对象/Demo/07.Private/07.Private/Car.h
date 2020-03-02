//
//  Car.h
//  07.Private
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
{
//@protected  //受保护的属性 ,默认就是protected
    NSString *_name;    
    
@private  //使用private修饰属性是私有的，只能本类才可以访问，子类也无法访问
    NSString *_brand;
    
@public  //公有的属性，内部、外部都可以直接访问
    NSString *_color;
    
}

- (void)run;

@end
