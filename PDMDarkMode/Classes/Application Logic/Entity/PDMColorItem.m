//
//  PDMColorItem.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/9.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "PDMColorItem.h"
#import "PDMColor.h"

@interface PDMColorItem ()

@property (nonatomic, strong) PDMColor *myReplacingColor;

@end

@implementation PDMColorItem

+ (NSUInteger)colorHash:(UIColor *)color {
    CGFloat r,g,b,a;
    [color getRed:&r green:&g blue:&b alpha:&a];
    if (r > 0.01) {
        r-=0.01;
    }
    if (g > 0.01) {
        g-=0.01;
    }
    if (b > 0.01) {
        b-=0.01;
    }
    if (a > 0.01) {
        a-=0.01;
    }
    NSUInteger hashCode = 0;
    hashCode += (NSUInteger)(r * kPDMColorDegreeOfAccuracy) * pow(kPDMColorDegreeOfAccuracy, 3);
    hashCode += (NSUInteger)(g * kPDMColorDegreeOfAccuracy) * pow(kPDMColorDegreeOfAccuracy, 2);
    hashCode += (NSUInteger)(b * kPDMColorDegreeOfAccuracy) * pow(kPDMColorDegreeOfAccuracy, 1);
    hashCode += (NSUInteger)(a * kPDMColorDegreeOfAccuracy) * pow(kPDMColorDegreeOfAccuracy, 0);
    return hashCode;
}

- (instancetype)initWithOriginalColorString:(NSString *)originalColorString replacingColorString:(NSString *)replacingColorString {
    self = [super init];
    if (self) {
        self.originalColor = [self colorWithColorString:originalColorString];
        self.myReplacingColor = [[PDMColor alloc] initWithColor:[self colorWithColorString:replacingColorString]];
        self.originalColorHash = [PDMColorItem colorHash:self.originalColor];
    }
    return self;
}

- (UIColor *)replacingColor {
    return [self.myReplacingColor color];
}

- (UIColor *)colorWithColorString:(NSString *)colorString {
    NSRange notesRange = [colorString rangeOfString:@"["];
    colorString = notesRange.location != NSNotFound ? [colorString substringToIndex:notesRange.location] : colorString;
    NSArray *colorComponents = [colorString componentsSeparatedByString:@","];
    CGFloat r = 0.0,g = 0.0,b = 0.0,a = 1.0,o=0.0;
    if ([colorComponents count] >= 1) {
        r = [colorComponents[0] floatValue] / 255.0;
    }
    if ([colorComponents count] >= 2) {
        g = [colorComponents[1] floatValue] / 255.0;
    }
    if ([colorComponents count] >= 3) {
        b = [colorComponents[2] floatValue] / 255.0;
    }
    if ([colorComponents count] >= 4) {
        a = [colorComponents[3] floatValue];
    }
    if ([colorComponents count] >= 5) {
        o = [colorComponents[4] floatValue] / 255.0;
        self.availabelOffset = o;
    }
    return [UIColor colorWithRed:r green:g blue:b alpha:a];
}

@end
