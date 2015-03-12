//
//  UIImageView+PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/12.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "UIImageView+PDMRender.h"

@implementation UIImageView (PDMRender)

- (BOOL)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem {
    if (![super pdm_rendWithSkinItem:skinItem]) {
        return NO;
    }
    {
        UIImage *image = self.image;
        [skinItem imageItemWithOriginImage:image withCompletionBlock:^(PDMImageItem *foundItem) {
            if (foundItem != nil) {
                self.image = [UIImage imageNamed:foundItem.replacingImageName];
                [self setObject:foundItem.originalImageName forRestoreKey:@"originalImageName"];
            }
        }];
    }
    return YES;
}

- (void)pdm_restore {
    [super pdm_restore];
    if (self.pdm_restoreData[@"originalImageName"]) {
        self.image = [UIImage imageNamed:self.pdm_restoreData[@"originalImageName"]];
    }
}

@end
