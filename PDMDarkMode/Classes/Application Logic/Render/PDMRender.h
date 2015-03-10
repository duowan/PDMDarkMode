//
//  PDMRender.h
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/9.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class PDMSkinManager;

@interface PDMRender : NSObject

- (instancetype)initWithManager:(PDMSkinManager *)manager;

/**
 *  渲染指定View
 */
- (void)rendWithView:(UIView *)view;

/**
 *  递归渲染指定View以及该View下的所有subView
 */
- (void)recursiveRendWithView:(UIView *)view;

@end
