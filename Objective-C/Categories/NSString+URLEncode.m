//
//  NSString+URLEncode.m
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import "NSString+URLEncode.h"
#import "NSString+Utils.h"

@implementation NSString (URLEncode)

- (NSDictionary *)bb_parameterWithURL
{
    NSMutableDictionary *parm = [[NSMutableDictionary alloc]init];
    
    //传入url创建url组件类
    NSURLComponents *urlComponents = [[NSURLComponents alloc] initWithString:self.bb_url.absoluteString];
    
    //回调遍历所有参数，添加入字典
    [urlComponents.queryItems enumerateObjectsUsingBlock:^(NSURLQueryItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [parm setObject:obj.value forKey:obj.name];
    }];
    
    return parm;
}

@end
