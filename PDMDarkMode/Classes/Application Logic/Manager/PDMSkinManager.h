//
//  PDMSkinManager.h
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/9.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PDMSkinItem.h"

@interface PDMSkinManager : NSObject

- (void)addItem:(PDMSkinItem *)item;

- (void)applyWithViewController:(UIViewController *)viewController;

- (void)applyWithView:(UIView *)view isRecursive:(BOOL)isRecursive;

- (void)restoreWithViewController:(UIViewController *)viewController;

- (void)restoreWithView:(UIView *)view isRecursive:(BOOL)isRecursive;

@end
