//
//  NSString+PinYin.h
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (PinYin)
/**
 Method                         Result
 Original                       @"中文"
 pinyinWithPhoneticSymbol       @"zhōng wén"
 pinyin                         @"zhong wen"
 pinyinArray                    @[@"zhong", @"wen"]
 pinyinWithoutBlank             @"zhongwen"
 pinyinInitialsArray            @[@"z", @"w"]
 pinyinInitialsString           @"zw"
 */
- (NSString *)pinyinWithPhoneticSymbol;
- (NSString *)pinyin;
- (NSArray *)pinyinArray;
- (NSString *)pinyinWithoutBlank;
- (NSArray *)pinyinInitialsArray;
- (NSString *)pinyinInitialsString;

@end

NS_ASSUME_NONNULL_END
