//
//  ViewController.m
//  定时器
//
//  Created by Stephen on 2017/9/16.
//  Copyright © 2017年 Stephen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    
    //加入运行循环runloop
    /*
     NSDefaultRunLoopMode: 时钟、网络事件
     NSRunLoopCommonModes: 用户交互
     */
    [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
    

}

- (void)updateTime {
    static int num = 0;
    NSLog(@"睡一会~~~");
    [NSThread sleepForTimeInterval:1.0];
    NSLog(@"%@ %d", [NSThread currentThread], num++);
    
    
    
    
}

@end
