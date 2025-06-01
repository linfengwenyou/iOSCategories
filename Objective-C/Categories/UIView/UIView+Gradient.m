//
//  UIView+Gradient.m
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import "UIView+Gradient.h"
#import <objc/runtime.h>

static const void *kUIViewLBGradientLayerGradientLayerKey = &kUIViewLBGradientLayerGradientLayerKey;

@implementation UIView (Gradient)

- (CAGradientLayer *)gradientLayer {
    
    CAGradientLayer *gradientLayer = objc_getAssociatedObject(self, kUIViewLBGradientLayerGradientLayerKey);
    
    if (nil == gradientLayer) {
        gradientLayer = [CAGradientLayer layer];
        [self.layer addSublayer:gradientLayer];
        
        objc_setAssociatedObject(self, kUIViewLBGradientLayerGradientLayerKey, gradientLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return gradientLayer;
}


- (void)setGradientLayer:(UIColor*)startColor endColor:(UIColor*)endColor{
    [self setGradientLayer:startColor endColor:endColor startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1) locations:@[@(0.5f), @(1.0f)]];
}

- (void)setGradientLayer:(UIColor*)startColor endColor:(UIColor*)endColor frame:(CGRect)frame {
    [self setGradientLayer:startColor endColor:endColor startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1) locations:@[@(0.5f), @(1.0f)] frame:frame];
}

- (void)setGradientLayerH:(UIColor*)startColor endColor:(UIColor*)endColor{
    [self setGradientLayer:startColor endColor:endColor startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0) locations:@[@(0.5f), @(1.0f)]];
}

- (void)setGradientLayerH:(UIColor*)startColor endColor:(UIColor*)endColor frame:(CGRect)frame {
    [self setGradientLayer:startColor endColor:endColor startPoint:CGPointMake(0, 0) endPoint:CGPointMake(1, 0) locations:@[@(0.5f), @(1.0f)] frame:frame];
}

- (void)setGradientLayer:(UIColor*)startColor
                endColor:(UIColor*)endColor
              startPoint:(CGPoint)startPoint
                endPoint:(CGPoint)endPoint locations:(NSArray<NSNumber *> *)locations {
    [self setGradientLayer:startColor endColor:endColor startPoint:startPoint endPoint:endPoint locations:locations frame:self.bounds];
}

- (void)setGradientLayer:(UIColor*)startColor
                endColor:(UIColor*)endColor
              startPoint:(CGPoint)startPoint
                endPoint:(CGPoint)endPoint
               locations:(NSArray<NSNumber *> *)locations
                   frame:(CGRect)frame {
    //    [self removeSubGradientLayer];
    
    //初始化CAGradientlayer对象，使它的大小为UIView的大小
    CAGradientLayer *gradientLayer = self.gradientLayer;
    gradientLayer.frame = frame;
    
    //将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
    
    //设置渐变区域的起始和终止位置（范围为0-1）
    gradientLayer.startPoint = CGPointZero;
    gradientLayer.startPoint = startPoint;
    gradientLayer.endPoint = CGPointZero;
    gradientLayer.endPoint = endPoint;
    
    //设置颜色数组
    //    gradientLayer.colors = @[(__bridge id)[UIColor blueColor].CGColor,
    //                                  (__bridge id)[UIColor redColor].CGColor];
    gradientLayer.colors = nil;
    gradientLayer.colors = @[(__bridge id)startColor.CGColor,
                             (__bridge id)endColor.CGColor];
    
    //设置颜色分割点（范围：0-1）
    gradientLayer.locations = nil;
    gradientLayer.locations = locations;
    [gradientLayer setNeedsDisplay];
}


// 设置阴影
- (void)setShadowColor:(UIColor *)color opacity:(CGFloat)opacity shadowRadius:(CGFloat)shadowRadius shadowOffset:(CGSize)shadowOffset {
    // 即阴影颜色值
    self.layer.shadowColor = color.CGColor;
    // 阴影的位置
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
    // 即阴影相对于Y轴有3个像素点的向下位移
    self.layer.shadowOffset = shadowOffset;
    //设置阴影的不透明度
    self.layer.shadowOpacity = opacity;
    // 阴影的模糊度
    self.layer.shadowRadius = shadowRadius;
    //设置抗锯齿边缘
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.clipsToBounds = NO;
}

@end
