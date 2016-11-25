
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

#### YWStringNumberHandler：
- Default: NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO  raiseOnDivideByZero:YES isAutoFilling:YES
- 默认：保留两位小数、向上、向下、精度溢出都不抛出异常、除0时抛出.对结果未达到要保留的小树位数时进行补0.

###  RoundingMode:
```
// Rounding policies :
// Original
//    value 1.2  1.21  1.25  1.35  1.27
// Plain    1.2  1.2   1.3   1.4   1.3  四舍五入
// Down     1.2  1.2   1.2   1.3   1.2  向下取正
// Up       1.2  1.3   1.3   1.4   1.3  向上取正
// Bankers  1.2  1.2   1.2   1.4   1.3  (特殊的四舍五入，碰到保留位数后一位的数字为5时，根据前一位的奇偶性决定。为偶时向下取正，为奇数时向上取正。如：1.25保留1为小数。5之前是2偶数向下取正1.2；1.35保留1位小数时。5之前为3奇数，向上取正1.4）

```

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


