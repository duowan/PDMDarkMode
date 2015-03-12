//
//  PDMSkinItem.h
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/9.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class PDMColorItem, PDMImageItem;

@interface PDMSkinItem : NSObject

/**
 *  @brief 样式将应用在指定UIView、UIViewController中
 *  NSSet -> NSString
 *  NSString = 类名
 */
@property (nonatomic, copy) NSSet *applyClasses;

/**
 *  @brief 样式将不会应用在指定的UIView、UIViewController中
 *  NSSet -> NSString
 *  NSString = 类名
 */
@property (nonatomic, copy) NSSet *avoidClasses;

/**
 *  @brief 样式表
 *  key = 原始色值 r,g,b,a,o[注释]
 *  value = 目标色值 r,g,b,a[注释]
 *  r,g,b,a,o 意思是 Red Green Blue Alpha + Offset（色差）
 *  其中r,g,b,a,o均为10进制
 *  r,g,b ~ [0,255] a ~ [0.0,1.0] o ~ [0,255]
 *  一个标准的格式：纯黑色 0,0,0,1.0,0 纯白色 255,255,255,1.0,0
 *  当Offset色差存在时，识别颜色时允许目标View原始色值有Offset值的上下浮动
 */
@property (nonatomic, copy) NSDictionary *styleSheet;

/**
 *  @brief 颜色对象
 *  NSOrderedSet -> PDMColorItem
 */
@property (nonatomic, copy) NSOrderedSet *colorItems;

/**
 *  @brief 图片对象
 *  NSDictionary -> Key:PDMImageItem.originalImageHash => Value:PDMImageItem
 */
@property (nonatomic, copy) NSDictionary *imageItems;

- (void)loadStyleSheetFromPlist:(NSString *)filePath;

- (void)colorItemWithOriginColor:(UIColor *)originColor
             withCompletionBlock:(void (^)(PDMColorItem *foundItem))completionBlock;

- (void)imageItemWithOriginImage:(UIImage *)originImage
             withCompletionBlock:(void (^)(PDMImageItem *foundItem))comletionBlock;

@end
