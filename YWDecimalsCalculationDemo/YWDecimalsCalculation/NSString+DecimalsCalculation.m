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

- (NSString *)yw_stringNumberByAdding:(NSString *)stringNumber{
    return [self yw_stringNumberByAdding:stringNumber
                            withBehavior:[YWStringNumberHandler defaultStringNumberHandler]];
}
- (NSString *)yw_stringNumberBySubtracting:(NSString *)stringNumber{
    return [self yw_stringNumberBySubtracting:stringNumber withBehavior:[YWStringNumberHandler defaultStringNumberHandler]];
}
- (NSString *)yw_stringNumberByMultiplyingBy:(NSString *)stringNumber{
    return [self yw_stringNumberByMultiplyingBy:stringNumber withBehavior:[YWStringNumberHandler defaultStringNumberHandler]];
}
- (NSString *)yw_stringNumberByDividingBy:(NSString *)stringNumber{
    return [self yw_stringNumberByDividingBy:stringNumber withBehavior:[YWStringNumberHandler defaultStringNumberHandler]];
}


- (NSString *)yw_stringNumberByAdding:(NSString *)stringNumber withBehavior:(YWStringNumberHandler *)handler{
    return  [self yw_stringNumberByCalculationType:CalculationAdding by:stringNumber withBehavior:handler];
}
- (NSString *)yw_stringNumberBySubtracting:(NSString *)stringNumber withBehavior:(YWStringNumberHandler *)handler{
    return  [self yw_stringNumberByCalculationType:CalculationSubtracting by:stringNumber withBehavior:handler];
}
- (NSString *)yw_stringNumberByMultiplyingBy:(NSString *)stringNumber withBehavior:(YWStringNumberHandler *)handler{
    return  [self yw_stringNumberByCalculationType:CalculationMultiplying by:stringNumber withBehavior:handler];
}
- (NSString *)yw_stringNumberByDividingBy:(NSString *)stringNumber withBehavior:(YWStringNumberHandler *)handler{
    return  [self yw_stringNumberByCalculationType:CalculationDividing by:stringNumber withBehavior:handler];
}


- (NSString *)yw_stringNumberByCalculationType:(CalculationType)type by:(NSString *)stringNumber withBehavior:(YWStringNumberHandler *)handler{
    
    
#ifdef DEBUG
    NSAssert([self yw_isValidateDecimalsNum], @"DecimalsCalculation // current string is not validate DecimalsNum");
    NSAssert([stringNumber yw_isValidateDecimalsNum], @"DecimalsCalculation // stringNumber is not validate DecimalsNum");
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
            // 至少有小数要求才添加0补充
            if (handler.scale != 0) {
                stringResult = [NSString stringWithFormat:@"%@.%@",stringResult,supplementZero];
            }
        }
    }
    return stringResult;
}


@end


@implementation NSString (NumberRegex)

- (BOOL)yw_isValidateDecimalsNum{
    BOOL isValid = YES;
    NSUInteger len = self.length;
    if (len > 0) {
        NSString *numberRegex = @"^[-+]?[0-9]*\\.?[0-9]*$";
        NSPredicate *numberPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
        isValid = [numberPredicate evaluateWithObject:self];
    }
    return isValid;
}

@end
