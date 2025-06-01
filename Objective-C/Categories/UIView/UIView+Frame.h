//
//  UIView+Frame.h
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Frame)

@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;

@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat right;
@property (nonatomic, assign) CGFloat bottom;
/** 判断view是否相交 */
- (BOOL)intersectWithView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
