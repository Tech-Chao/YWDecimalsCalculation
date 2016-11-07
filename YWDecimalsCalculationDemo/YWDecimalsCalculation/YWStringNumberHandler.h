//
//  YWStringNumberHandler.h
//  YWDecimalsCalculationDemo
//
//  Created by FishYu on 16/11/4.
//  Copyright © 2016年 codeFisher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YWStringNumberHandler : NSDecimalNumberHandler


@property (nonatomic, assign,readonly) short accuracy;
@property (nonatomic, assign,readonly) BOOL isAutoFilling; // Default YES


+ (instancetype)defaultStringNumberHandler;
- (instancetype)initWithRoundingMode:(NSRoundingMode)roundingMode scale:(short)scale raiseOnExactness:(BOOL)exact raiseOnOverflow:(BOOL)overflow raiseOnUnderflow:(BOOL)underflow raiseOnDivideByZero:(BOOL)divideByZero isAutoFilling:(BOOL)isAutoFilling;

@end
