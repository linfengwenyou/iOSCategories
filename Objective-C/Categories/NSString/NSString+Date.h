//
//  NSString+Date.h
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Date)
/// 时间戳转格式化字符 13位
+ (NSString*)timeWithYearMonthDayCountDown:(NSString*)timestamp formatter:(NSString *)formatter;

/// 时间戳转格式化字符 10位
+ (NSString*)timeTenLengthWithYearMonthDayCountDown:(NSString*)timestamp formatter:(NSString *)formatter;

@end

NS_ASSUME_NONNULL_END
/*
 * 使用方式：
 [self timeWithYearMonthDayCountDown:self.startTimestamp formatter:@"yyyy-MM-dd"];
 [NSString timeTenLengthWithYearMonthDayCountDown:model.tradeTime formatter:@"yyyy-MM-dd HH:mm:ss"];
 */
