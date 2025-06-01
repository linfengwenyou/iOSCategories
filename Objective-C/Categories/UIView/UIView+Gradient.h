//
//  UIView+Gradient.h
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Gradient)
/**
 设置渐变色
 */
- (void)setGradientLayer:(UIColor*)startColor endColor:(UIColor*)endColor;
- (void)setGradientLayer:(UIColor*)startColor endColor:(UIColor*)endColor frame:(CGRect)frame;
- (void)setGradientLayerH:(UIColor*)startColor endColor:(UIColor*)endColor;
- (void)setGradientLayerH:(UIColor*)startColor endColor:(UIColor*)endColor frame:(CGRect)frame;
- (void)setGradientLayer:(UIColor*)startColor
                endColor:(UIColor*)endColor
              startPoint:(CGPoint)startPoint
                endPoint:(CGPoint)endPoint
               locations:(NSArray<NSNumber *> *)locations;
- (void)setGradientLayer:(UIColor*)startColor
                endColor:(UIColor*)endColor
              startPoint:(CGPoint)startPoint
                endPoint:(CGPoint)endPoint
               locations:(NSArray<NSNumber *> *)locations
                   frame:(CGRect)frame;

/** 设置阴影
 * color: 设置阴影的颜色
 * opacity: 设置阴影的不透明度 ex: 1
 * shadowRadius: 阴影的模糊度 ex: 5
 * shadowOffset: 阴影的便宜 ex: CGSizeMake(0, 3) 影相对于Y轴有3个像素点的向下位移
 */
- (void)setShadowColor:(UIColor *)color opacity:(CGFloat)opacity shadowRadius:(CGFloat)shadowRadius shadowOffset:(CGSize)shadowOffset;
@end

NS_ASSUME_NONNULL_END
