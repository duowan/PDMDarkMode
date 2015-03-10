//
//  PDMDarkModeTests.m
//  PDMDarkModeTests
//
//  Created by 崔 明辉 on 15/3/9.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PDMSkinItem.h"

@interface PDMDarkModeTests : XCTestCase

@end

@implementation PDMDarkModeTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testColorSearch {
    PDMSkinItem *skinItem = [[PDMSkinItem alloc] init];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Demo" ofType:@"plist"];
    [skinItem loadStyleSheetFromPlist:plistPath];
    [skinItem colorItemWithOriginColor:[UIColor whiteColor] withCompletionBlock:^(PDMColorItem *foundItem) {
        XCTAssertNotNil(foundItem);
    }];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
}

- (void)testColorBinarySearch {
    PDMSkinItem *skinItem = [[PDMSkinItem alloc] init];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Demo" ofType:@"plist"];
    [skinItem loadStyleSheetFromPlist:plistPath];
    [skinItem colorItemWithOriginColor:[UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:1.0]
                   withCompletionBlock:^(PDMColorItem *foundItem) {
        XCTAssertNotNil(foundItem);
    }];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
}

- (void)testNotATargetColorBinarySearch {
    PDMSkinItem *skinItem = [[PDMSkinItem alloc] init];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Demo" ofType:@"plist"];
    [skinItem loadStyleSheetFromPlist:plistPath];
    [skinItem colorItemWithOriginColor:[UIColor colorWithRed:0.94 green:0.94 blue:0.99 alpha:1.0]
                   withCompletionBlock:^(PDMColorItem *foundItem) {
                       XCTAssertNil(foundItem);
                   }];
    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
}

@end
