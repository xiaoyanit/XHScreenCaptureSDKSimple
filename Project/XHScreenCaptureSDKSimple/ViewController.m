//
//  ViewController.m
//  XHScreenCapture
//
//  Created by 曾 宪华 on 14-1-8.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import "ViewController.h"
#import <XHScreenCaptureSDK/XHScreenCapture.h>
#import <XHScreenCaptureSDK/XHDrawView.h>
#import "XHVideoPlayViewController.h"

@interface ViewController () {
    XHScreenCapture *screenCapture;
    NSDate* recordStartTime;
    NSTimer* timerRecord;
}
@property (weak, nonatomic) IBOutlet XHDrawView *drawView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UILabel *labelTimeElapsed;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateTimeElapsed
{
    dispatch_async(dispatch_get_main_queue(), ^{
        NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:recordStartTime];
        [self.labelTimeElapsed setText:[NSString stringWithFormat:@"Time Elapsed: %d Sec", (int)timeInterval]];
    });
}


- (IBAction)startRecordingClicked:(UIButton *)sender {
    
    //Start recording video.
    if (sender.tag == 0)
    {
        sender.tag = 1;
        [sender setTitle:@"停止录制" forState:UIControlStateNormal];
        screenCapture = [[XHScreenCapture alloc] init];
        [screenCapture startVideoCapture];
        [self.progressView setProgress:0 animated:NO];
        recordStartTime = [NSDate date];
        timerRecord = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimeElapsed) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timerRecord forMode:NSRunLoopCommonModes];
    }
    //Start recording video.
    else
    {
        self.drawView.userInteractionEnabled = NO;
        [sender setEnabled:NO];
        [timerRecord invalidate];
        [self.activityIndicator startAnimating];
        __weak typeof(self) weakSelf = self;
        [screenCapture stopVideoCaptureWithProgress:^(CGFloat progress) {
            [weakSelf.progressView setProgress:progress animated:YES];
        } CompletionHandler:^(NSDictionary *info, NSError *error) {
            [self.progressView setProgress:0 animated:NO];
            [self.activityIndicator stopAnimating];
            NSLog(@"%@",info);
            sender.tag = 0;
            [sender setTitle:@"开始录制" forState:UIControlStateNormal];
            weakSelf.drawView.userInteractionEnabled = YES;
            [sender setEnabled:YES];
            NSString *audioPath = [info valueForKey:XHAudioFilePathKey];
            NSString *videoPath = [info valueForKey:XHVideoFilePathKey];
            NSString *videoFileSize = [info valueForKey:XHVideoFileSizeKey];
            NSLog(@"audioPath : %@    videoPath : %@  videoFileSize : %@", audioPath, videoPath, videoFileSize);
            
            NSString *videoOutputPath =[[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingString:@"/outputMovie.mov"];
            if ([[NSFileManager defaultManager] fileExistsAtPath:videoOutputPath])
                [[NSFileManager defaultManager] removeItemAtPath:videoOutputPath error:nil];
            [XHScreenCapture compileFilesToMakeMovieOutputPath:videoOutputPath videoInputPath:videoPath audioInputPath:audioPath CompileFilesToMakeMovieBlock:^{
                XHVideoPlayViewController *videoPlayViewController = [[XHVideoPlayViewController alloc] init];
                videoPlayViewController.videoPath = videoOutputPath;
                [self.navigationController pushViewController:videoPlayViewController animated:YES];
            }];
        }];
    }
    
}

@end
