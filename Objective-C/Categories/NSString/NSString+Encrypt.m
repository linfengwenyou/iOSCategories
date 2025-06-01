//
//  NSString+Encrypt.m
//  TestCategoriesDemo
//
//  Created by Buck on 2025/6/1.
//

#import "NSString+Encrypt.h"
#import <CommonCrypto/CommonDigest.h>
#import <Availability.h>
#import "NSData+Encrypt.h"

@implementation NSString (Encrypt)

- (NSString *)bb_SHA1WithSalt:(NSString *)salt
{
    NSMutableString *result = nil;
    if (self) {
        
        NSString *signMaterial = self;
        if (salt) {
            
            signMaterial = [salt stringByAppendingString:self];
        }
        
        const char *cstr = [signMaterial cStringUsingEncoding:NSUTF8StringEncoding];
        NSData *data = [NSData dataWithBytes:cstr length:signMaterial.length];
        uint8_t digest[CC_SHA1_DIGEST_LENGTH];
        CC_SHA1(data.bytes, (uint32_t)data.length, digest);
        result = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
        
        for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
            
            [result appendFormat:@"%02x", digest[i]];
        }
    }
    return result;
    
}

- (NSString *)bb_SHA1ForHiTalent
{
    return [self bb_SHA1WithSalt:@""];
}

+ (NSString *)bb_randomString:(int)digit
{
    int NUMBER_OF_CHARS = digit;
    char data[NUMBER_OF_CHARS];
    for (int x = 0; x < NUMBER_OF_CHARS; data[x++] = (char)('a' + (arc4random_uniform(26))));
    return [[NSString alloc] initWithBytes:data length:NUMBER_OF_CHARS encoding:NSUTF8StringEncoding];
}

+ (NSString *)bb_generateRandom
{
    return [self bb_randomString:8];
}

- (NSString *)bb_md5
{
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (unsigned int)strlen(cStr), digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}




+ (NSString *)stringWithBase64EncodedString:(NSString *)string
{
    NSData *data = [NSData dataWithBase64EncodedString:string];
    if (data)
    {
        return [[self alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return nil;
}

- (NSString *)base64EncodedStringWithWrapWidth:(NSUInteger)wrapWidth
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data base64EncodedStringWithWrapWidth:wrapWidth];
}

- (NSString *)base64EncodedString
{
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    return [data base64EncodedString];
}

- (NSString *)base64DecodedString
{
    return [NSString stringWithBase64EncodedString:self];
}

- (NSData *)base64DecodedData
{
    return [NSData dataWithBase64EncodedString:self];
}

@end
