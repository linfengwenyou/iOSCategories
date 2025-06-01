//
//  NSString+Utils.h
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Utils)

/**
 *  判断URL中是否包含中文
 *  @return
 *      是否包含中文
 */
- (BOOL)bb_isContainChinese;

/**
 *  是否包含空格
 *  @return
 *      是否包含空格
 */
- (BOOL)bb_isContainBlank;

/**
 *  是否包含字符串
 *  @param
 *      string  字符串
 *  @return
 *      YES, 包含
 */
- (BOOL)bb_containsaString:(NSString *)string;

/**
 *  获取字符数量
 */
- (int)bb_wordsCount;

/// 获取 URL
- (NSURL *)bb_url;

/// 计算剩余数字，total - 一共多少字（汉字），返回剩余字数。两个拼音算一个汉字
- (int)bb_surplusWordWithTotalCount:(NSInteger)total;

/// 文本复制
- (void)bb_copyToPasteboard;

- (NSString *)bb_placeHolder1;
@end

NS_ASSUME_NONNULL_END
