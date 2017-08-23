//
//  NSString+DecimalsCalculation.m
//  YWDecimalsCalculationDemo
//
//  Created by FishYu on 16/11/4.
//  Copyright © 2016年 codeFisher. All rights reserved.
//

#import "NSString+DecimalsCalculation.h"
#import "YWDecimalNumberHandler.h"

static NSNumberFormatter * YWDecimalNumberFormatter(NSUInteger scale){
    
    static NSNumberFormatter *numberFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        numberFormatter = [NSNumberFormatter new];
        numberFormatter.numberStyle = kCFNumberFormatterNoStyle;
        numberFormatter.alwaysShowsDecimalSeparator = YES;
    });
    numberFormatter.minimumFractionDigits = scale;
    return numberFormatter;
}
// CalculationType
typedef NS_ENUM(NSInteger,CalculationType){
    CalculationAdding,
    CalculationSubtracting,
    CalculationMultiplying,
    CalculationDividing,
};

@implementation NSString (DecimalsCalculation)

- (NSString *)yw_stringNumberByAdding:(NSString *)stringNumber{
    return [self yw_stringNumberByAdding:stringNumber
                            withBehavior:[YWDecimalNumberHandler defaultStringNumberHandler]];
}
- (NSString *)yw_stringNumberBySubtracting:(NSString *)stringNumber{
    return [self yw_stringNumberBySubtracting:stringNumber withBehavior:[YWDecimalNumberHandler defaultStringNumberHandler]];
}
- (NSString *)yw_stringNumberByMultiplyingBy:(NSString *)stringNumber{
    return [self yw_stringNumberByMultiplyingBy:stringNumber withBehavior:[YWDecimalNumberHandler defaultStringNumberHandler]];
}
- (NSString *)yw_stringNumberByDividingBy:(NSString *)stringNumber{
    return [self yw_stringNumberByDividingBy:stringNumber withBehavior:[YWDecimalNumberHandler defaultStringNumberHandler]];
}


- (NSString *)yw_stringNumberByAdding:(NSString *)stringNumber withBehavior:(YWDecimalNumberHandler *)handler{
    return  [self yw_stringNumberByCalculationType:CalculationAdding by:stringNumber withBehavior:handler];
}
- (NSString *)yw_stringNumberBySubtracting:(NSString *)stringNumber withBehavior:(YWDecimalNumberHandler *)handler{
    return  [self yw_stringNumberByCalculationType:CalculationSubtracting by:stringNumber withBehavior:handler];
}
- (NSString *)yw_stringNumberByMultiplyingBy:(NSString *)stringNumber withBehavior:(YWDecimalNumberHandler *)handler{
    return  [self yw_stringNumberByCalculationType:CalculationMultiplying by:stringNumber withBehavior:handler];
}
- (NSString *)yw_stringNumberByDividingBy:(NSString *)stringNumber withBehavior:(YWDecimalNumberHandler *)handler{
    return  [self yw_stringNumberByCalculationType:CalculationDividing by:stringNumber withBehavior:handler];
}


- (NSString *)yw_stringNumberByCalculationType:(CalculationType)type by:(NSString *)stringNumber withBehavior:(YWDecimalNumberHandler *)handler{
    
    NSDecimalNumber *selfNumber = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *calcuationNumber = [NSDecimalNumber decimalNumberWithString:stringNumber];
   
    NSDecimalNumber *result = nil;
    if (CalculationAdding == type) {
        result = [selfNumber decimalNumberByAdding:calcuationNumber withBehavior:handler];
    }else if (CalculationSubtracting == type){
        result = [selfNumber decimalNumberBySubtracting:calcuationNumber withBehavior:handler];
    }else if (CalculationMultiplying == type){
        result = [selfNumber decimalNumberByMultiplyingBy:calcuationNumber withBehavior:handler];
    }else if (CalculationDividing == type){
        result = [selfNumber decimalNumberByDividingBy:calcuationNumber withBehavior:handler];
    }
    
    // 精度
    short scale =  [handler scale];
    NSNumberFormatter *numberFormatter = YWDecimalNumberFormatter((NSUInteger)scale);
    NSLog(@"%@",numberFormatter);
    return [numberFormatter stringFromNumber:result];
}


@end
