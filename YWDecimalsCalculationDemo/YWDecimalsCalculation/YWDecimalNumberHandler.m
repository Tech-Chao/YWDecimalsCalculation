//
//  YWDecimalNumberHandler.m
//  YWDecimalsCalculationDemo
//
//  Created by FishYu on 2017/8/23.
//  Copyright © 2017年 codeFisher. All rights reserved.
//

#import "YWDecimalNumberHandler.h"

@implementation YWDecimalNumberHandler

+ (instancetype)defaultStringNumberHandler {
    YWDecimalNumberHandler *handler = [[self alloc] initWithRoundingMode:NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
    return handler;
}

@end
