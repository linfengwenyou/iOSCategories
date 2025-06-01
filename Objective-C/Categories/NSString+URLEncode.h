//
//  NSString+URLEncode.h
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (URLEncode)

- (NSDictionary *)bb_parameterWithURL;
@end

NS_ASSUME_NONNULL_END
