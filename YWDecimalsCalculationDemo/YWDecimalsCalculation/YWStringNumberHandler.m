//
//  YWStringNumberHandler.m
//  YWDecimalsCalculationDemo
//
//  Created by FishYu on 16/11/4.
//  Copyright © 2016年 codeFisher. All rights reserved.
//

#import "YWStringNumberHandler.h"

@interface YWStringNumberHandler ()


@end

@implementation YWStringNumberHandler

+ (instancetype)defaultStringNumberHandler{

    return [[self alloc] initWithRoundingMode:NSRoundPlain
                                        scale:2
                             raiseOnExactness:NO
                              raiseOnOverflow:NO
                             raiseOnUnderflow:NO
                          raiseOnDivideByZero:YES];
}

- (instancetype)initWithRoundingMode:(NSRoundingMode)roundingMode scale:(short)scale raiseOnExactness:(BOOL)exact raiseOnOverflow:(BOOL)overflow raiseOnUnderflow:(BOOL)underflow raiseOnDivideByZero:(BOOL)divideByZero{
  
    return [self initWithRoundingMode:roundingMode scale:scale raiseOnExactness:exact raiseOnOverflow:overflow raiseOnUnderflow:underflow raiseOnDivideByZero:divideByZero isAutoFilling:YES];
}

- (instancetype)initWithRoundingMode:(NSRoundingMode)roundingMode scale:(short)scale raiseOnExactness:(BOOL)exact raiseOnOverflow:(BOOL)overflow raiseOnUnderflow:(BOOL)underflow raiseOnDivideByZero:(BOOL)divideByZero isAutoFilling:(BOOL)isAutoFilling{
    if (self = [super initWithRoundingMode:roundingMode scale:scale raiseOnExactness:exact raiseOnOverflow:overflow raiseOnUnderflow:underflow raiseOnDivideByZero:isAutoFilling]) {
        _accuracy = scale;
        _isAutoFilling = isAutoFilling;
    }
    return self;
}
@end
