//
//  PDMColorItem.h
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/9.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define kPDMColorDegreeOfAccuracy 100

@interface PDMColorItem : NSObject

@property (nonatomic, strong) UIColor *originalColor;

@property (nonatomic, strong) UIColor *replacingColor;

@property (nonatomic, assign) NSUInteger originalColorHash;

@property (nonatomic, assign) CGFloat availabelOffset;

+ (NSUInteger)colorHash:(UIColor *)color;

- (instancetype)initWithOriginalColorString:(NSString *)originalColorString
                       replacingColorString:(NSString *)replacingColorString;

@end
