//
//  PDMDictionary.h
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/12.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PDMDictionary : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

- (id)objectForKey:(id)aKey;

- (id)objectForKeyedSubscript:(id)key;

@end
