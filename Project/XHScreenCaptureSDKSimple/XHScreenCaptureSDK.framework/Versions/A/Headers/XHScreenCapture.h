//
//  XHScreenCapture.h
//  XHScreenCapture
//
//  Created by 曾 宪华 on 14-1-8.
//  Copyright (c) 2014年 曾宪华 开发团队(http://iyilunba.com ) 本人QQ:543413507. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ProgressBlock)(CGFloat progress);
typedef void(^CompletionBlock)(NSDictionary* info, NSError* error);

typedef void(^CompileFilesToMakeMovieBlock)(void);

@interface XHScreenCapture : NSObject

+(XHScreenCapture*)sharedController;

//Start capturing video of screen. Automatically call stopVideoCapture after 'seconds' parameter.
-(void)startVideoCaptureOfDuration:(NSInteger)seconds WithProgress:(ProgressBlock)progressBlock completionBlock:(CompletionBlock)completionBlock;

//Start capturing video of screen. You need to manually call stopVideoCapture to stop video capture.
-(void)startVideoCapture;

//Stop video capture.
-(void)stopVideoCaptureWithProgress:(ProgressBlock)progressBlock CompletionHandler:(CompletionBlock)completionBlock;

//Cancel video capture.
-(void)cancel;

// Composition
+ (void)compileFilesToMakeMovieOutputPath:(NSString *)outputPath videoInputPath:(NSString *)videoInputPath audioInputPath:(NSString *)soundInputPath CompileFilesToMakeMovieBlock:(CompileFilesToMakeMovieBlock)compileFilesToMakeMovieBlock;

@end

extern NSString *const XHAudioFilePathKey;
extern NSString *const XHVideoFilePathKey;
extern NSString *const XHVideoFileSizeKey;
extern NSString *const XHVideoFileCreateDateKey;

