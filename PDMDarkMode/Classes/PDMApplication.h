//
//  PDMApplication.h
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/9.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PDMSkinManager.h"

/**
 *  PDMApplication manages application skin changes.
 */
@interface PDMApplication : NSObject

+ (PDMApplication *)sharedApplication;

- (PDMSkinManager *)defaultManager;

@end
