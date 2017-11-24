
Usage 
===

新版本采用NSNumberFormatter格式化计算结果，直接通过scale设置最后计算结果的小数点位数

```objc

// result = @"12.00"
NSString  *result = [@"10" yw_stringByAdding:@"2"];  


NSString  *result =  [@"10"  yw_stringBySubtracting:@"2"]; // @"8.00"
NSString  *result =  [@"10"  yw_stringByMultiplyingBy:@"2"]; // @"20.00"
NSString  *result =  [@"10"  yw_stringByDividingBy:@"2"]; // @"5.00"
``` 

#### NSNumberHandler：
- Default: NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO  raiseOnDivideByZero:YES 
- 默认：保留两位小数、向上、向下、精度溢出都不抛出异常、除0时抛出. 

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


