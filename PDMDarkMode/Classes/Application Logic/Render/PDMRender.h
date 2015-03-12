//
//  PDMRender.h
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/9.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class PDMSkinItem;

@interface PDMRender : NSObject

- (void)rendWithSkinItem:(PDMSkinItem *)skinItem forView:(UIView *)view;

- (BOOL)restoreWithView:(UIView *)view;

@end
