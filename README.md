XHScreenCaptureSDKSimple
========================

## English：    
XHScreenCaptureSDKSimple is a full screen recording generated video components    
Has the following features:
1, to record the voices around equipment
2, support block, easy to destroy
3, have the use of the public API
4, generate video support
5, support to generate wear around video voice augmented reality sense
6, support CocoaPods installation

## 中文：   
XHScreenCaptureSDKSimple 是一款全屏录制生成视频的组件。     
有以下功能：     
1、可录制设备周围的声音     
2、支持block简便毁掉      
3、有公开的使用api       
4、支持生成视频      
5、支持生成佩戴周围声音增强现实感觉的视频      
6、支持CocoaPods安装


![image](https://github.com/JackTeam/XHScreenCaptureSDKSimple/raw/master/Screenshots/XHScreenCaptureSDKSimple.gif)

## Ease to use
``` objective-c   
screenCapture = [[XHScreenCapture alloc] init];
```
1、Manual call setup screen recording, manual calls to stop the screen recording, very reasonable use     
``` objective-c   
[screenCapture startVideoCapture];   
[screenCapture stopVideoCaptureWithProgress:^(CGFloat progress) {
    } CompletionHandler:^(NSDictionary *info, NSError *error) {
}]; 
```    

2、 call this method was auto stop recoder.     need to set stop Duration 10s.
``` objective-c    
[screenCapture startVideoCaptureOfDuration:10 WithProgress:^(CGFloat progress) {

    } completionBlock:^(NSDictionary *info, NSError *error) {

}]; 
```


## 使用简单方便
1、手动调用启动屏幕录制，手动调用停止屏幕录制，很合理的使用
``` objective-c    
[screenCapture startVideoCapture];       
```
``` objective-c
[screenCapture stopVideoCaptureWithProgress:^(CGFloat progress) {
    } CompletionHandler:^(NSDictionary *info, NSError *error) {
}];
```

2、调用这个方法会自动停止屏幕录制，可以设置停止时间.10s
``` objective-c
[screenCapture startVideoCaptureOfDuration:10 WithProgress:^(CGFloat progress) {

    } completionBlock:^(NSDictionary *info, NSError *error) {

}];       
```     

## open source model
1, here is the SDK mode    
2, as long as pay attention to the component of a total of more than 500 users, will with all open source code model.   

Please click to all open source code: https://github.com/JackTeam/XHScreenCaptureSDKSimple     

    
## 开源模式
1、这里已经是SDK模式了     
2、只要关注该组件的用户数量达到500个以上，将以开源所有代码的模式。    

请移步到开源所有代码：https://github.com/JackTeam/XHScreenCaptureSDKSimple   


## License
English: XHScreenCaptureSDKSimple is acailable under the MIT license, see the LICENSE file for more information.     
中文: XHScreenCaptureSDKSimple 是在MIT协议下使用的，可以在LICENSE文件里面找到相关的使用协议信息.     
