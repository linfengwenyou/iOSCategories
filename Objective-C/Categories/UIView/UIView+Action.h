//
//  UIView+Action.h
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Action)
/**
 * 为视图添加一个事件
 */
- (void)easy_addTapCallBack:(id)target sel:(SEL)selector;

@end

NS_ASSUME_NONNULL_END
