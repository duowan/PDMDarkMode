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

@property (nonatomic, strong) NSTimer *fastChangeTimer;

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
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"Testing"];
//        [text addAttribute:NSForegroundColorAttributeName
//                     value:[UIColor blackColor]
//                     range:NSMakeRange(0, [text length])];
//        self.firstLabel.attributedText = text;
//        self.secondLabel.text = @"Hello, World!";
//    });
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.fastChangeTimer =
    [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(fastChangeTest) userInfo:nil repeats:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.fastChangeTimer invalidate];
}

- (void)fastChangeTest {
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"Fast Change Test:%u", arc4random()]];
    [text addAttribute:NSForegroundColorAttributeName
                 value:[UIColor blackColor]
                 range:NSMakeRange(0, [text length])];
    [text addAttribute:NSForegroundColorAttributeName
                 value:[UIColor colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0]
                 range:NSMakeRange(0, 17)];
    self.firstLabel.attributedText = text;
    self.secondLabel.text = [NSString stringWithFormat:@"Fast Change Test:%u", arc4random()];
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
