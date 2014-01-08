//
//  XHVideoPlayViewController.m
//  XHScreenCapture
//
//  Created by 曾 宪华 on 14-1-8.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "XHVideoPlayViewController.h"
#import <XHScreenCaptureSDK/XHVideoPlayView.h>

@interface XHVideoPlayViewController ()
@property (nonatomic, strong) XHVideoPlayView *videoPlayView;
@end

@implementation XHVideoPlayViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.videoPlayView play];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _videoPlayView = [[XHVideoPlayView alloc] initWithFrame:self.view.bounds];
    [_videoPlayView.player setSmoothLoopItemByStringPath:self.videoPath smoothLoopCount:1];
    [self.view addSubview:self.videoPlayView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
