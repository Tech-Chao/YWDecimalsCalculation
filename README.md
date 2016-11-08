Usage
==========

```
 [@"10" stringNumberByAdding:@"2"]; // 12.00
 Equals

 // YWStringNumberHandler
 // Default: NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO 
 // raiseOnUnderflow:NO raiseOnDivideByZero:YES 
 [@"10" stringNumberByAdding:@"2" withBehavior:[YWStringNumberHandler defaultStringNumberHandler]];
 [@"10" stringNumberBySubtracting:@"2"]; // 8.00
 [@"10" stringNumberByMultiplyingBy:@"2"]; // 20.00
 [@"10" stringNumberByDividingBy:@"2"]; // 5.00
 
 // Default 2 decimal places Fill-in 0.But You can changed by assign a special handler(YWStringNumberHandler). like blow
 
 // 3 decimal places Fill-in 0
 YWStringNumberHandler *handler = [[YWStringNumberHandler alloc] initWithRoundingMode:NSRoundPlain
                                                                                 scale:3
                                                                                 raiseOnExactness:NO
                                                                                 raiseOnOverflow:NO
                                                                                 raiseOnUnderflow:NO
                                                                                 raiseOnDivideByZero:YES];
 OR
 // 4 decimal places.NOT Fill-in 0
 YWStringNumberHandler *handler = [[YWStringNumberHandler alloc] initWithRoundingMode:NSRoundPlain
                                                                                  scale:4
                                                                                  raiseOnExactness:NO
                                                                                  raiseOnOverflow:NO
                                                                                  raiseOnUnderflow:NO
                                                                                  raiseOnDivideByZero:YES
                                                                                isAutoFilling:NO];
 // scale:4
 [@"10" stringNumberByAdding:@"2" withBehavior:handler] // 12.0000
 [@"10" stringNumberBySubtracting:@"2" withBehavior:handler] // 8.0000
 [@"10" stringNumberByMultiplyingBy:@"2" withBehavior:handler] // 20.0000
 [@"10" stringNumberByDividingBy:@"2" withBehavior:handler] // 5.0000
``` 


