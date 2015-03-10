//
//  ViewController.m
//  PDMDarkMode
//
//  Created by 崔 明辉 on 15/3/9.
//  Copyright (c) 2015年 多玩事业部 iOS开发组 YY Inc. All rights reserved.
//

#import "ViewController.h"
#import "PDMApplication.h"

@interface ViewController (){
    BOOL isOn;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleSwitchButtonTapped:(id)sender {
    if (!isOn) {
        [[[PDMApplication sharedApplication] defaultManager] applyWithViewController:self];
    }
    else {
        [[[PDMApplication sharedApplication] defaultManager] restoreWithViewController:self];
    }
    isOn = !isOn;
}

@end
