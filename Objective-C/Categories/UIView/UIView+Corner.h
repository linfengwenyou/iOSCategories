//
//  UIView+Corner.h
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, UIBorderSideType) {
    UIBorderSideTypeAll  = 0,
    UIBorderSideTypeTop = 1 << 0,
    UIBorderSideTypeBottom = 1 << 1,
    UIBorderSideTypeLeft = 1 << 2,
    UIBorderSideTypeRight = 1 << 3,
};

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Corner)

/*! 设置圆角 左右四个角都可以单独或组合设置 */
- (void)setCorner:(UIRectCorner)corners radius:(float)radius;

/*! layer设置圆角 */
- (void)setRoundRadius:(float)radius borderColor:(UIColor *)bColor;
- (void)setRoundRadius:(float)radius borderColor:(UIColor *)bColor board:(CGFloat)board;
- (void)setResterizeRoundRadius:(float)radius borderColor:(UIColor *)bColor;

// 设置部分圆角 corners: UIRectCornerTopLeft | UIRectCornerTopRight
- (void)setTopLeftRightCornerRadius:(CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
