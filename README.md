
Usage 
===

```objc

// result = @"12.00"
NSString  *result = [@"10" stringNumberByAdding:@"2"]; 
 Equals
// result = @"12.00"
NSString  *result = [@"10" stringNumberByAdding:@"2" withBehavior:[YWStringNumberHandler defaultStringNumberHandler]];


NSString  *result =  [@"10" stringNumberBySubtracting:@"2"]; // @"8.00"
NSString  *result =  [@"10" stringNumberByMultiplyingBy:@"2"]; // @"20.00"
NSString  *result =  [@"10" stringNumberByDividingBy:@"2"]; // @"5.00"
``` 

- YWStringNumberHandler：
Default: NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO  raiseOnDivideByZero:YES isAutoFilling:YES
默认：保留两位小数、向上、向下、精度溢出都不抛出异常、除0时抛出.对结果未达到要保留的小树位数时进行补0.


```objc
 // Default 2 decimal places Fill-in 0.But You can changed by assign a special handler(YWStringNumberHandler). like blow
 // 4 decimal places Fill-in 0
 // 通过配置scale来确认小数点后保留几位。不足时根据isAutoFilling决定在计算结果后是否补0.
 YWStringNumberHandler *handler = [[YWStringNumberHandler alloc] initWithRoundingMode:NSRoundPlain
                                                                                 scale:4
                                                                                 raiseOnExactness:NO
                                                                                 raiseOnOverflow:NO
                                                                                 raiseOnUnderflow:NO
                                                                                 raiseOnDivideByZero:YES
										 isAutoFilling:YES]; 
 // scale:4
 [@"10" stringNumberByAdding:@"2" withBehavior:handler] // 12.0000
 [@"10" stringNumberBySubtracting:@"2" withBehavior:handler] // 8.0000
 [@"10" stringNumberByMultiplyingBy:@"2" withBehavior:handler] // 20.0000
 [@"10" stringNumberByDividingBy:@"2" withBehavior:handler] // 5.0000
``` 

