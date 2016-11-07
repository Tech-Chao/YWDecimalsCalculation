//
//  NSString+DecimalsCalculation.m
//  YWDecimalsCalculationDemo
//
//  Created by FishYu on 16/11/4.
//  Copyright © 2016年 codeFisher. All rights reserved.
//

#import "NSString+DecimalsCalculation.h"

// CalculationType
typedef NS_ENUM(NSInteger,CalculationType){
    CalculationAdding,
    CalculationSubtracting,
    CalculationMultiplying,
    CalculationDividing,
};

@implementation NSString (DecimalsCalculation)

- (NSString *)stringNumberByAdding:(NSString *)stringNumber{
    return [self stringNumberByAdding:stringNumber
                         withBehavior:[YWStringNumberHandler defaultStringNumberHandler]];
}
- (NSString *)stringNumberBySubtracting:(NSString *)stringNumber{
    return [self stringNumberBySubtracting:stringNumber withBehavior:[YWStringNumberHandler defaultStringNumberHandler]];
}
- (NSString *)stringNumberByMultiplyingBy:(NSString *)stringNumber{
    return [self stringNumberByMultiplyingBy:stringNumber withBehavior:[YWStringNumberHandler defaultStringNumberHandler]];
}
- (NSString *)stringNumberByDividingBy:(NSString *)stringNumber{
    return [self stringNumberByDividingBy:stringNumber withBehavior:[YWStringNumberHandler defaultStringNumberHandler]];
}


- (NSString *)stringNumberByAdding:(NSString *)stringNumber withBehavior:(YWStringNumberHandler *)handler{
    return  [self stringNumberByCalculationType:CalculationAdding by:stringNumber withBehavior:handler];
}
- (NSString *)stringNumberBySubtracting:(NSString *)stringNumber withBehavior:(YWStringNumberHandler *)handler{
    return  [self stringNumberByCalculationType:CalculationSubtracting by:stringNumber withBehavior:handler];
}
- (NSString *)stringNumberByMultiplyingBy:(NSString *)stringNumber withBehavior:(YWStringNumberHandler *)handler{
    return  [self stringNumberByCalculationType:CalculationMultiplying by:stringNumber withBehavior:handler];
}
- (NSString *)stringNumberByDividingBy:(NSString *)stringNumber withBehavior:(YWStringNumberHandler *)handler{
    return  [self stringNumberByCalculationType:CalculationDividing by:stringNumber withBehavior:handler];
}


- (NSString *)stringNumberByCalculationType:(CalculationType)type by:(NSString *)stringNumber withBehavior:(YWStringNumberHandler *)handler{
    
#ifdef DEBUG
    NSAssert([self validateDecimalsNum], @"DecimalsCalculation // current string is not validate DecimalsNum");
    NSAssert([stringNumber validateDecimalsNum], @"DecimalsCalculation // stringNumber is not validate DecimalsNum");
#endif

    NSDecimalNumber *selfNumber = [NSDecimalNumber decimalNumberWithString:self];
    NSDecimalNumber *calcuationNumber = [NSDecimalNumber decimalNumberWithString:stringNumber];
    
    NSString *stringResult = nil;
    if (CalculationAdding == type) {
        stringResult = [[selfNumber decimalNumberByAdding:calcuationNumber withBehavior:handler] stringValue];
    }else if (CalculationSubtracting == type){
        stringResult = [[selfNumber decimalNumberBySubtracting:calcuationNumber withBehavior:handler] stringValue];
    }else if (CalculationMultiplying == type){
        stringResult = [[selfNumber decimalNumberByMultiplyingBy:calcuationNumber withBehavior:handler] stringValue];
    }else if (CalculationDividing == type){
        stringResult = [[selfNumber decimalNumberByDividingBy:calcuationNumber withBehavior:handler] stringValue];
    }else{
        stringResult = @"0";
    }
    
    if ([stringResult isEqualToString:@"NaN"]) {
        stringResult = @"0";
    }
    if (stringResult.length > 0 && handler.isAutoFilling) {
        /// 添加要显示的0
        NSMutableString *supplementZero = [NSMutableString string];
        for (short i = 0; i< handler.accuracy; i++) {
            [supplementZero  appendString:@"0"];
        }
        
        if ([stringResult rangeOfString:@"."].location != NSNotFound) {
            
            NSString *strDecimal = [[[[stringResult componentsSeparatedByString:@"."] lastObject] stringByAppendingString:supplementZero] substringToIndex:handler.accuracy];
            stringResult = [NSString stringWithFormat:@"%@.%@",[[stringResult componentsSeparatedByString:@"."] firstObject],strDecimal];
        }else{
            stringResult = [NSString stringWithFormat:@"%@.%@",stringResult,supplementZero];
        }
    }
    return stringResult;
}




- (BOOL)validateDecimalsNum{
    BOOL isValid = YES;
    NSUInteger len = self.length;
    if (len > 0) {
        NSString *numberRegex = @"^-?\\d*.?\\d*";
        NSPredicate *numberPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
        isValid = [numberPredicate evaluateWithObject:self];
    }
    return isValid;
}
@end
