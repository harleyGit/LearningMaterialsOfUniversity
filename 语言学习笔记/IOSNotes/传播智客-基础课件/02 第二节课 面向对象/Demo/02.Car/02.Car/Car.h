//
//  Car.h
//  02.Car
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject {
    NSString *_brand;   //品牌
    NSString *_color;   //颜色
}

- (void)setBrand:(NSString *)brand;
- (void)setColor:(NSString *)color;

//刹车
- (void)brake;

//加速
- (void)quicken;

@end
