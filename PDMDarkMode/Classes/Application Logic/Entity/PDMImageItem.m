//
//  PDMImageItem.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/12.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "PDMImageItem.h"
#import <UIKit/UIKit.h>

@implementation PDMImageItem

+ (NSUInteger)imageHashWithImageName:(NSString *)imageName {
    UIImage *image = [UIImage imageNamed:imageName];
    return [UIImagePNGRepresentation(image) hash];
}

- (instancetype)initWithOriginalImageName:(NSString *)originalImageName
                       replacingImageName:(NSString *)replacingImageName
{
    self = [super init];
    if (self) {
        self.originalImageName = [self imageNameWithImageNameString:originalImageName];
        self.replacingImageName = [self imageNameWithImageNameString:replacingImageName];
        self.originalImageHash = [PDMImageItem imageHashWithImageName:self.originalImageName];
    }
    return self;
}

- (NSString *)imageNameWithImageNameString:(NSString *)imageNameString {
    NSRange notesRange = [imageNameString rangeOfString:@"["];
    imageNameString = notesRange.location != NSNotFound ? [imageNameString substringToIndex:notesRange.location] : imageNameString;
    imageNameString = [imageNameString stringByReplacingOccurrencesOfString:@"img:" withString:@""];
    return imageNameString;
}

@end
