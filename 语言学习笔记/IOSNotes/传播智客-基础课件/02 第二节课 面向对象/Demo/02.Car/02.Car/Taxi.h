//
//  Taxi.h
//  02.Car
//
//  Created by wei.chen on 13-7-26.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Car.h"

@interface Taxi : Car {
    NSString *_company; //所属公司
}

//打印发票
- (void)printTick;

@end
