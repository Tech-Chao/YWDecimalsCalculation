
Usage 
===

```
// Rounding policies :
// Original
//    value 1.2  1.21  1.25  1.35  1.27
// Plain    1.2  1.2   1.3   1.4   1.3  四舍五入
// Down     1.2  1.2   1.2   1.3   1.2  向下取正
// Up       1.2  1.3   1.3   1.4   1.3  向上取正
// Bankers  1.2  1.2   1.2   1.4   1.3  (特殊的四舍五入，碰到保留位数后一位的数字为5时，根据前一位的奇偶性决定。为偶时向下取正，为奇数时向上取正。如：1.25保留1为小数。5之前是2偶数向下取正1.2；1.35保留1位小数时。5之前为3奇数，向上取正1.4）

```

新版本采用NSNumberFormatter格式化计算结果，直接通过scale设置最后计算结果的小数点位数，下面是部分计算例子：
ps:开发可以通过设置RoudingMode和scale来设置计算结果的四舍五入的方式和保留小数的位数。
```objc
// 10.4+2: 四舍五入不保留小数
NSString  *result = [@"10.4" yw_stringByAdding:@"2" withRoundingMode:NSRoundPlain scale:0];  // @"12"
// 10.4-2：向下取值保留一位小数
NSString  *result = [@"10.4" yw_stringBySubtracting:@"2" withRoundingMode:NSRoundDown scale:1];  // @"8.4"
// 10.4*2: 四舍五入，保留三位小数
NSString  *result = [@"10.4"  yw_stringByMultiplyingBy:@"2" withRoundingMode:NSRoundPlain scale:3]; // @"20.800"
// 10.4÷2：默认四舍五入，保留两位小数
NSString  *result = [@"10.4"  yw_stringByDividingBy:@"2"]; // @"5.20"
``` 

在使用过程中如果有任何疑问可以给我issue，如果觉得对你的问题的有所帮助话给个Star✨吧！！🙂

