//
//  YWDecimalNumberHandler.h
//  YWDecimalsCalculation
//
//  Created by FishYu on 2017/8/23.
//  Copyright © 2017年 codeFisher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YWDecimalNumberHandler : NSDecimalNumberHandler

+ (instancetype)defaultStringNumberHandler;

// 自定义的数字格式，结果会忽略设置的scale和formatterStyle
@property (nonatomic, strong) NSNumberFormatter *numberFormatter;
// formatter 的格式
@property NSNumberFormatterStyle formatterStyle;

@end
