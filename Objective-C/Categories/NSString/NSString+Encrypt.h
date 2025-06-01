//
//  NSString+Encrypt.h
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Encrypt)

/**
 *  Sha1 加密，配合 salt
 *  salt 将会放在字符串最前面
 */
- (NSString *)bb_SHA1WithSalt:(NSString *)salt;

/**
 *  网络请求签名
 */
- (NSString *)bb_SHA1ForHiTalent;

/**
 *  随机生成指定位数字符串
 */
+ (NSString *)bb_randomString:(int)digit;

/**
 *  随机生成符串
 */
+ (NSString *)bb_generateRandom;

/**
 *  生成 md5 字符串
 */
- (NSString *)bb_md5;


+ (NSString *)stringWithBase64EncodedString:(NSString *)string;
- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth;
- (NSString *)base64EncodedString;
- (NSString *)base64DecodedString;
- (NSData *)base64DecodedData;
@end

NS_ASSUME_NONNULL_END
