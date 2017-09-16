//
//  ViewController.m
//  pthread
//
//  Created by apple on 2017/8/27.
//  Copyright © 2017年 apple. All rights reserved.
//  在多线程开发中，千万不要相信一次的运行结果

#import "ViewController.h"
#import <pthread.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [self pthreadDemo];

}

- (void)pthreadDemo {

    /*
      pthread属于POSIX 多线程开发框架
      参数1: 指向线程的指针
      参数2: 线程属性
      参数3: 指向函数的指针
      参数4: 传递给函数的参数
      返回值: 特别是在C语言的框架中非常常见，如果是0表示正确，非0表示错误代码
     
        void *  (*)     (void *)
        返回值  函数指针     参数
     
        void * 等价于 OC id
     */
    NSString *str = @"hello world";
    pthread_t threadId;
    int result = pthread_create(&threadId, NULL, &demo, (__bridge void *)(str));
    if (result == noErr) {
        NSLog(@"OK");
    }else {
        NSLog(@"error: %d", result);
    }




}

void * demo(void *para){
    return NULL;
}

@end
