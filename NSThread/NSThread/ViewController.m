//
//  ViewController.m
//  NSThread
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
    //[self threadDemo1];

    [self threadDemo2];
}

- (void)threadDemo3 {
    NSLog(@"A-------%@", [NSThread currentThread]);

    [self performSelectorInBackground:@selector(demo:) withObject:@"background"];

    NSLog(@"B--------%@", [NSThread currentThread]);

}

- (void)threadStatus {
    NSLog(@"sleep~~~~~");
    [NSThread sleepForTimeInterval:2];
    for (int i = 0; i < 20; i++) {
        NSLog(@"%@ %d", [NSThread currentThread], i);
         
    }
}




- (void)threadDemo2 {

    NSLog(@"A--------%@", [NSThread currentThread]);
    [NSThread detachNewThreadSelector:@selector(demo:) toTarget:self withObject:@"Detach"];

    NSLog(@"B--------%@", [NSThread currentThread]);


}


- (void)threadDemo1 {
    NSLog(@"A-------");
    //创建一个NSThread
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(demo:) object:@"Thread"];
    [thread start];
    for (int i = 0; i < 10; i++) {
        NSLog(@"%d", i);
    }
    NSLog(@"B--------");
}

- (void)demo:(id)obj {
    for (int i = 0; i < 2; i++) {
        NSLog(@"C---------%@", [NSThread currentThread]);
    }
}
@end
