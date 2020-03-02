//
//  Children.m
//  task7
//
//  Created by wei.chen on 12-12-17.
//  Copyright (c) 2012年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "Children.h"
#import "Nure.h"
#import "Nanny.h"

@implementation Children

- (id)init {
    self = [super init];
    if (self != nil) {
                
        [NSTimer scheduledTimerWithTimeInterval:1
                                         target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    }
    return self;
}

/*
- (void)setNure:(Nure *)nure {
    _nure = nure;
}
*/

- (void)setNanny:(Nanny *)nanny {
    _nanny = nanny;
}

- (void)setNure:(Nure *)nure {
    _nure= nure;
}

- (void)timerAction:(NSTimer *)timer {
    timeValue++;
    
    if (timeValue == 5) {
       [_nure wash:self];
        
        [_nanny washBoy:self];
    }
    if (timeValue == 10) {
        [_nure play:self];
        
        [_nanny playBoy:self];
    }
}




@end
