//
//  UILabel+PDMRender.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/10.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "UILabel+PDMRender.h"

@implementation UILabel (PDMRender)

- (void)pdm_rendWithSkinItem:(PDMSkinItem *)skinItem {
    [super pdm_rendWithSkinItem:skinItem];
    NSAttributedString *attributedText = self.attributedText;
    NSRange attributedTextRange = NSMakeRange(0, [attributedText length]);
    [attributedText enumerateAttribute:NSForegroundColorAttributeName inRange:attributedTextRange options:kNilOptions usingBlock:^(id value, NSRange range, BOOL *stop) {
        if (NSEqualRanges(range, attributedTextRange)) {
            UIColor *textColor = self.textColor;
            [skinItem colorItemWithOriginColor:textColor withCompletionBlock:^(PDMColorItem *foundItem) {
                if (foundItem != nil) {
                    self.textColor = foundItem.replacingColor;
                }
            }];
        }
        else {
            UIColor *textColor = value;
            [skinItem colorItemWithOriginColor:textColor withCompletionBlock:^(PDMColorItem *foundItem) {
                if (foundItem != nil) {
                    NSMutableAttributedString *mutableString = [self.attributedText mutableCopy];
                    [mutableString setAttributes:@{NSForegroundColorAttributeName: foundItem.replacingColor} range:range];
                    self.attributedText = [mutableString copy];
                }
            }];
        }
    }];
}

@end
