//
//  Person.m
//  task8
//
//  Created by wei.chen on 13-7-31.
//  Copyright (c) 2013年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Person.h"
#import "Agent.h"
@implementation Person

- (id)initWithDelegate:(id<PersonDelegate>)delegate {
    self = [super init];
    if (self != nil) {
        _delegate = delegate;
    }
    return self;
}
//找房子
- (void)findHouse {
    
    [NSTimer scheduledTimerWithTimeInterval:1
                                     target:self
                                   selector:@selector(timerAction:)
                                   userInfo:nil
                                    repeats:YES];

}

- (void)timerAction:(NSTimer *)timer {
    
    
    BOOL response = [_delegate respondsToSelector:@selector(lookforApartme:)];
    
    if (response) {
        //调用代理对象找房子的方法
        long price = [_delegate lookforApartme:self];
        
        //NSString *name = [_delegate name];
        
        if (price < 3000) {
            NSLog(@"价格：%ld,这个价格的房子，我租下来了",price);
            
            //让定时器终止
            [timer invalidate];
        }
    }
}
@end
