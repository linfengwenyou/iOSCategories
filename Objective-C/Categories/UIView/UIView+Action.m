//
//  UIView+Action.m
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import "UIView+Action.h"

@implementation UIView (Action)

- (void)easy_addTapCallBack:(id)target sel:(SEL)selector
{
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:selector];
    [self addGestureRecognizer:tap];
}
@end
