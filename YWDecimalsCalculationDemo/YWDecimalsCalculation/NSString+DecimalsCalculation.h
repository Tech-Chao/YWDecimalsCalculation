//
//  NSString+DecimalsCalculation.h
//  YWDecimalsCalculationDemo
//
//  Created by FishYu on 16/11/4.
//  Copyright © 2016年 codeFisher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YWStringNumberHandler.h"


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
 
 
 // Default: NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES
 Usage:
 [@"10" stringNumberByAdding:@"2"] // 12.00
 equals
 [@"10" stringNumberByAdding:@"2" withBehavior:[YWStringNumberHandler defaultStringNumberHandler]]
 
 [@"10" stringNumberBySubtracting:@"2"] // 8.00
 [@"10" stringNumberByMultiplyingBy:@"2"] // 20.00
 [@"10" stringNumberByDividingBy:@"2"] // 5.00
 
 // Default have two decimal,You can changed by assign a special handler(YWStringNumberHandler).blow
 
 YWStringNumberHandler *handler = [[YWStringNumberHandler alloc] initWithRoundingMode:NSRoundPlain
                                                                                 scale:3
                                                                                 raiseOnExactness:NO
                                                                                 raiseOnOverflow:NO
                                                                                 raiseOnUnderflow:NO
                                                                                 raiseOnDivideByZero:YES];
 OR
 
 YWStringNumberHandler *handler = [[YWStringNumberHandler alloc] initWithRoundingMode:NSRoundPlain
                                                                                  scale:3
                                                                                  raiseOnExactness:NO
                                                                                  raiseOnOverflow:NO
                                                                                  raiseOnUnderflow:NO
                                                                                  raiseOnDivideByZero:YES
                                                                                  isAutoFilling:YES];
 // scale:3
 [@"10" stringNumberByAdding:@"2" withBehavior:handler] // 12.000
 [@"10" stringNumberBySubtracting:@"2" withBehavior:handler] // 8.000
 [@"10" stringNumberByMultiplyingBy:@"2" withBehavior:handler] // 20.000
 [@"10" stringNumberByDividingBy:@"2" withBehavior:handler] // 5.000
 
 */

@interface NSString (DecimalsCalculation)

// Adding
- (NSString *)yw_stringNumberByAdding:(NSString *)stringNumber;
- (NSString *)yw_stringNumberByAdding:(NSString *)stringNumber withBehavior:(YWStringNumberHandler *)handler;

// Subtracting
- (NSString *)yw_stringNumberBySubtracting:(NSString *)stringNumber;
- (NSString *)yw_stringNumberBySubtracting:(NSString *)stringNumber withBehavior:(YWStringNumberHandler *)handler;

// Multiplying
- (NSString *)yw_stringNumberByMultiplyingBy:(NSString *)stringNumber;
- (NSString *)yw_stringNumberByMultiplyingBy:(NSString *)stringNumber withBehavior:(YWStringNumberHandler *)handler;

// Dividing
- (NSString *)yw_stringNumberByDividingBy:(NSString *)stringNumber;
- (NSString *)yw_stringNumberByDividingBy:(NSString *)stringNumber withBehavior:(YWStringNumberHandler *)handler;

@end



@interface NSString (NumberRegex)

- (BOOL)yw_isValidateDecimalsNum;

@end
