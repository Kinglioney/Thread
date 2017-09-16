//
//  ViewController.m
//  耗时操作
//
//  Created by apple on 2017/8/26.
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


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    for (int i = 0; i < 500; i++) {

        // [NSThread currentThread]判断当前是哪个线程
        // number=1 代表主线程， 不等于1代表其他线程
        NSLog(@"%d %@", i, [NSThread currentThread]);
    }


}
@end
