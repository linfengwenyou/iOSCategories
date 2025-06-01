//
//  UIView+Corner.m
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import "UIView+Corner.h"
#import <objc/runtime.h>

static const void *kUIViewLBGradientLayerCornerLayerKey = &kUIViewLBGradientLayerCornerLayerKey;

static const void *kUIViewLBGradientLayerLeftLayerKey = &kUIViewLBGradientLayerLeftLayerKey;

static const void *kUIViewLBGradientLayerRightLayerKey = &kUIViewLBGradientLayerRightLayerKey;

static const void *kUIViewLBGradientLayerTopLayerKey = &kUIViewLBGradientLayerTopLayerKey;

static const void *kUIViewLBGradientLayerBottomLayerKey = &kUIViewLBGradientLayerBottomLayerKey;


@implementation UIView (Corner)


- (void)setCorner:(UIRectCorner)corners radius:(float)radius {
    UIBezierPath *maskPath;
    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:corners
                                           cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer *maskLayer = self.cornerShapeLayer;
    
    maskLayer.frame = self.bounds;
    maskLayer.path = nil;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)setRoundRadius:(float)radius borderColor:(UIColor *)bColor {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [bColor CGColor];
}

- (void)setRoundRadius:(float)radius borderColor:(UIColor *)bColor board:(CGFloat)board {
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
    self.layer.borderWidth = board;
    self.layer.borderColor = [bColor CGColor];
}

// 设置部分圆角
- (void)setTopLeftRightCornerRadius:(CGFloat)radius {
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(radius, radius)];
    
    CAShapeLayer * shapeLayer = [[CAShapeLayer alloc]init];
    shapeLayer.frame = self.bounds;
    shapeLayer.path = path.CGPath;
    self.layer.mask = shapeLayer;
}


- (UIView *)borderForColor:(UIColor *)color borderWidth:(CGFloat)borderWidth borderType:(UIBorderSideType)borderType {
    if (borderType == UIBorderSideTypeAll) {
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = color.CGColor;
        return self;
    }
    
    
    /// 左侧
    if (borderType & UIBorderSideTypeLeft) {
        /// 左侧线路径
        [self addLineOriginPoint:CGPointMake(0.f, 0.f) toPoint:CGPointMake(0.0f, self.frame.size.height) color:color borderWidth:borderWidth CAShapeLayer:self.leftLayer];
    }
    
    /// 右侧
    if (borderType & UIBorderSideTypeRight) {
        /// 右侧线路径
        [self addLineOriginPoint:CGPointMake(self.frame.size.width, 0.0f) toPoint:CGPointMake( self.frame.size.width, self.frame.size.height) color:color borderWidth:borderWidth CAShapeLayer:self.rightLayer];
    }
    
    /// top
    if (borderType & UIBorderSideTypeTop) {
        /// top线路径
        [self addLineOriginPoint:CGPointMake(0.0f, 0.0f) toPoint:CGPointMake(self.frame.size.width, 0.0f) color:color borderWidth:borderWidth CAShapeLayer:self.topLayer];
    }
    
    /// bottom
    if (borderType & UIBorderSideTypeBottom) {
        /// bottom线路径
        [self addLineOriginPoint:CGPointMake(0.0f, self.frame.size.height) toPoint:CGPointMake( self.frame.size.width, self.frame.size.height) color:color borderWidth:borderWidth CAShapeLayer:self.bottomLayer];
    }
    
    return self;
}

- (CAShapeLayer *)addLineOriginPoint:(CGPoint)p0 toPoint:(CGPoint)p1 color:(UIColor *)color borderWidth:(CGFloat)borderWidth CAShapeLayer:(CAShapeLayer *)shapeLayer {
    /// 线的路径
    UIBezierPath * bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:p0];
    [bezierPath addLineToPoint:p1];
    [shapeLayer setPath:nil];
    shapeLayer.strokeColor = color.CGColor;
    shapeLayer.fillColor  = [UIColor clearColor].CGColor;
    /// 添加路径
    shapeLayer.path = bezierPath.CGPath;
    /// 线宽度
    shapeLayer.lineWidth = borderWidth;
    [shapeLayer setNeedsDisplay];
    return shapeLayer;
}

- (void)setResterizeRoundRadius:(float)radius borderColor:(UIColor *)bColor {
    [self setRoundRadius:radius borderColor:bColor];
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
}
#pragma mark - getter

- (CAShapeLayer *)cornerShapeLayer {
    CAShapeLayer *cornerShapeLayer = objc_getAssociatedObject(self, kUIViewLBGradientLayerCornerLayerKey);
    
    if (nil == cornerShapeLayer) {
        cornerShapeLayer = [CAShapeLayer layer];
        objc_setAssociatedObject(self, kUIViewLBGradientLayerCornerLayerKey, cornerShapeLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return cornerShapeLayer;
}
- (CAShapeLayer *)leftLayer {
    
    CAShapeLayer *leftLayer = objc_getAssociatedObject(self, kUIViewLBGradientLayerLeftLayerKey);
    
    if (nil == leftLayer) {
        leftLayer = [CAShapeLayer layer];
        [self.layer addSublayer:leftLayer];
        
        objc_setAssociatedObject(self, kUIViewLBGradientLayerLeftLayerKey, leftLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return leftLayer;
}
- (CAShapeLayer *)rightLayer {
    
    CAShapeLayer *rightLayer = objc_getAssociatedObject(self, kUIViewLBGradientLayerRightLayerKey);
    if (nil == rightLayer) {
        rightLayer = [CAShapeLayer layer];
        [self.layer addSublayer:rightLayer];
        
        objc_setAssociatedObject(self, kUIViewLBGradientLayerRightLayerKey, rightLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return rightLayer;
}

- (CAShapeLayer *)topLayer {
    
    CAShapeLayer *topLayer = objc_getAssociatedObject(self, kUIViewLBGradientLayerTopLayerKey);
    if (nil == topLayer) {
        topLayer = [CAShapeLayer layer];
        [self.layer addSublayer:topLayer];
        
        objc_setAssociatedObject(self, kUIViewLBGradientLayerTopLayerKey, topLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return topLayer;
}

- (CAShapeLayer *)bottomLayer {
    
    CAShapeLayer *bottomLayer = objc_getAssociatedObject(self, kUIViewLBGradientLayerBottomLayerKey);
    if (nil == bottomLayer) {
        bottomLayer = [CAShapeLayer layer];
        [self.layer addSublayer:bottomLayer];
        
        objc_setAssociatedObject(self, kUIViewLBGradientLayerBottomLayerKey, bottomLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return bottomLayer;
}
@end
