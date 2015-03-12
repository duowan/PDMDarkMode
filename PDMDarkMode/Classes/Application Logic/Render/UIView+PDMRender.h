//
//  UIView+PDMRender.h
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/10.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PDMSkinItem.h"
#import "PDMColorItem.h"
#import "PDMImageItem.h"

@interface UIView (PDMRender)

@property (nonatomic, copy) NSSet *pdm_skinItems;

@property (nonatomic, copy) NSDictionary *pdm_restoreData;

- (BOOL)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem;

- (void)pdm_configureReactiveCocoa;

- (void)pdm_restore;

- (void)setObject:(id)object forRestoreKey:(NSString *)restoreKey;

@end
