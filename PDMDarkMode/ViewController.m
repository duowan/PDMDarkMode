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

@property (weak, nonatomic) IBOutlet UILabel *firstLabel;

@property (weak, nonatomic) IBOutlet UILabel *secondLabel;

@end

@implementation ViewController

- (void)dealloc
{
    NSLog(@"ViewController Deallocing");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"Testing"];
        [text addAttribute:NSForegroundColorAttributeName
                     value:[UIColor blackColor]
                     range:NSMakeRange(0, [text length])];
        self.firstLabel.attributedText = text;
        self.secondLabel.text = @"Hello, World!";
    });
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
