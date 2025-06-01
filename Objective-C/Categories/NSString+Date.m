//
//  NSString+Date.m
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import "NSString+Date.h"

@implementation NSString (Date)

+ (NSString*)timeWithYearMonthDayCountDown:(NSString*)timestamp formatter:(NSString *)formatter
{
    // 时间戳转日期// 传入的时间戳timeStr如果是精确到毫秒的记得要/1000
    NSTimeInterval timeInterval=[timestamp doubleValue]/1000;
    NSDate*detailDate=[NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter*dateFormatter=[[NSDateFormatter alloc]init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    // 实例化一个NSDateFormatter对象，设定时间格式，这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:formatter];
    NSString*dateStr=[dateFormatter stringFromDate:detailDate];
    return dateStr;
}

+ (NSString*)timeTenLengthWithYearMonthDayCountDown:(NSString*)timestamp formatter:(NSString *)formatter
{
    // 时间戳转日期// 传入的时间戳timeStr如果是精确到毫秒的记得要/1000
    NSTimeInterval timeInterval=[timestamp doubleValue];
    NSDate*detailDate=[NSDate dateWithTimeIntervalSince1970:timeInterval];
    NSDateFormatter*dateFormatter=[[NSDateFormatter alloc]init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    // 实例化一个NSDateFormatter对象，设定时间格式，这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:formatter];
    NSString*dateStr=[dateFormatter stringFromDate:detailDate];
    return dateStr;
}
@end
