//
//  NSArray+Utils.m
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import "NSArray+Utils.h"

@implementation NSArray (Utils)
- (NSString *)toJsonString {
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:kNilOptions error:&error];
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}
@end
