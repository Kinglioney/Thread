//
//  ViewController.m
//  NSThread状态
//
//  Created by apple on 2017/9/3.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"开始主线程-----");
    //杀死主线程
    //[NSThread exit];

    [self threadDemo];

    //[self exitDemo];

}

-  (void)exitDemo {
    [self performSelectorInBackground:@selector(startMainThread) withObject:nil];
}

- (void)startMainThread {
    [NSThread sleepForTimeInterval:1.0];
    [[NSThread mainThread]start];
}




- (void)threadDemo {
    //创建线程
    NSThread *thread =  [[NSThread alloc] initWithTarget:self selector:@selector(threadStatus) object:nil];
    //线程的属性
    //在项目开发中，可以根据这个线程的名字来查找崩溃的原因
    thread.name = @"Stephen_Thread";
    //线程的优先级 0.0~1.0 默认是0.5
    thread.threadPriority = 0.1;

    NSThread *thread2 =  [[NSThread alloc] initWithTarget:self selector:@selector(threadStatus) object:nil];
    //线程的属性
    //项目开发中，可以根据这个线程的名字来查找崩溃的原因
    thread2.name = @"Stephen_Thread2";
    //线程的优先级 0.0~1.0 默认是0.5 1.0是优先级最高，0是最低的
    //优先级只是保证CPU的调度可能性 建议: 不要在开发过程中修改优先级
    thread2.threadPriority = 1.0;

    //线程就绪
    [thread start];
    [thread2 start];
}

- (void)threadStatus {
    NSLog(@"sleep~~~~~~");

    for (int i = 0; i < 20; i++) {
        //阻塞线程
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"%@  %d", [NSThread currentThread], i);
        if (i == 15) {
            //退出线程: 一旦强行终止线程后，后续代码将不会执行
            [NSThread exit];
        }
    }
}


@end
