//
//  NSDictionary+Utils.m
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import "NSDictionary+Utils.h"

@implementation NSDictionary (Utils)
+ (NSString *)toJsonString:(id)obj {
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:obj options:NSJSONWritingPrettyPrinted error:&error];
    if (! jsonData) {
        
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

@end
