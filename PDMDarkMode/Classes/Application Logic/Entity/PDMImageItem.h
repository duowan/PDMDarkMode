//
//  PDMImageItem.h
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/12.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PDMImageItem : NSObject

@property (nonatomic, copy) NSString *originalImageName;

@property (nonatomic, copy) NSString *replacingImageName;

@property (nonatomic, assign) NSUInteger originalImageHash;

+ (NSUInteger)imageHashWithImageName:(NSString *)imageName;

- (instancetype)initWithOriginalImageName:(NSString *)originalImageName
                       replacingImageName:(NSString *)replacingImageName;

@end
