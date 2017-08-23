//
//  NSString+DecimalsCalculation.h
//  YWDecimalsCalculation
//
//  Created by FishYu on 16/11/4.
//  Copyright © 2016年 codeFisher. All rights reserved.
//

#import <Foundation/Foundation.h>
@class YWDecimalNumberHandler;
/**
// Rounding policies :
// Original
//    value 1.2  1.21  1.25  1.35  1.27
// Plain    1.2  1.2   1.3   1.4   1.3
// Down     1.2  1.2   1.2   1.3   1.2
// Up       1.2  1.3   1.3   1.4   1.3
// Bankers  1.2  1.2   1.2   1.4   1.3
 
typedef NS_ENUM(NSUInteger, NSRoundingMode) {
    NSRoundPlain,   // Round up on a tie
    NSRoundDown,    // Always down == truncate
    NSRoundUp,      // Always up
    NSRoundBankers  // on a tie round so last digit is even
};
 */
@interface NSString (DecimalsCalculation)

// Adding
- (NSString *)yw_stringNumberByAdding:(NSString *)stringNumber;
- (NSString *)yw_stringNumberByAdding:(NSString *)stringNumber withBehavior:(YWDecimalNumberHandler *)handler;

// Subtracting
- (NSString *)yw_stringNumberBySubtracting:(NSString *)stringNumber;
- (NSString *)yw_stringNumberBySubtracting:(NSString *)stringNumber withBehavior:(YWDecimalNumberHandler *)handler;

// Multiplying
- (NSString *)yw_stringNumberByMultiplyingBy:(NSString *)stringNumber;
- (NSString *)yw_stringNumberByMultiplyingBy:(NSString *)stringNumber withBehavior:(YWDecimalNumberHandler *)handler;

// Dividing
- (NSString *)yw_stringNumberByDividingBy:(NSString *)stringNumber;
- (NSString *)yw_stringNumberByDividingBy:(NSString *)stringNumber withBehavior:(YWDecimalNumberHandler *)handler;

@end
