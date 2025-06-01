//
//  NSDictionary+Utils.h
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Utils)
/*! dictionary转json字符串 */
+ (NSString *)toJsonString:(id)obj;
@end

NS_ASSUME_NONNULL_END
