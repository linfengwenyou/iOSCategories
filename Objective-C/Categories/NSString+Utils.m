//
//  NSString+Utils.m
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import "NSString+Utils.h"
#import <UIKit/UIKit.h>

@implementation NSString (Utils)

- (BOOL)bb_isContainChinese
{
    NSUInteger length = [self length];
    for (NSUInteger i = 0; i < length; i++) {
        NSRange range = NSMakeRange(i, 1);
        NSString *subString = [self substringWithRange:range];
        const char *cString = [subString UTF8String];
        if (strlen(cString) == 3) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)bb_isContainBlank
{
    NSRange range = [self rangeOfString:@" "];
    if (range.location != NSNotFound) {
        return YES;
    }
    return NO;
}

- (BOOL)bb_containsaString:(NSString *)string
{
    NSRange rang = [self rangeOfString:string];
    if (rang.location == NSNotFound) {
        return NO;
    } else {
        return YES;
    }
}

- (int)bb_wordsCount
{
    NSInteger n = self.length;
    int i;
    int l = 0, a = 0, b = 0;
    unichar c;
    for (i = 0; i < n; i++)
    {
        c = [self characterAtIndex:i];
        if (isblank(c)) {
            b++;
        } else if (isascii(c)) {
            a++;
        } else {
            l++;
        }
    }
    if (a == 0 && l == 0) {
        return 0;
    }
    return l + (int)ceilf((float)(a + b) / 2.0);
}

- (NSURL *)bb_url
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored"-Wdeprecated-declarations"
    return [NSURL URLWithString:(NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)self, (CFStringRef)@"!$&'()*+,-./:;=?@_%~#[]", NULL,kCFStringEncodingUTF8))];
#pragma clang diagnostic pop
}

- (int)bb_surplusWordWithTotalCount:(NSInteger)total
{
    int count = 0;
    if (self.length > 0) {
        int i, n = (int)[self length], l = 0, a = 0, b = 0;
        unichar c;
        for (i = 0; i < n; i++) {
            c = [self characterAtIndex:i];
            if (isblank(c)) {
                b++;
            } else if (isascii(c)) {
                a++;
            } else {
                l++;
            }
        }
        count = (int)(total - ((a == 0 && l == 0) ? 0 : l + (int)ceilf((float)(a + b) / 2.0)));
    } else {
        count = (int)total;
    }
    return count;
}

- (void)bb_copyToPasteboard
{
    NSString *copiedString = [self copy];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[UIPasteboard generalPasteboard] setString:copiedString];
    });
}

- (NSString *)bb_placeHolder1
{
    
    return self ?: @"--";
}

@end
