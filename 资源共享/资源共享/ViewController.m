//
//  ViewController.m
//  资源共享
//
//  Created by Stephen on 2017/9/16.
//  Copyright © 2017年 Stephen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (atomic, assign) int tickets;

@property (nonatomic, strong) NSObject *lockObj;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _lockObj = [NSObject new];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.tickets = 20;
    NSThread *t1 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTickets) object:nil];
    t1.name = @"售票员A";
    [t1 start];
    
    NSThread *t2 = [[NSThread alloc]initWithTarget:self selector:@selector(saleTickets) object:nil];
    t2.name = @"售票员B";
    [t2 start];
    
    
}
- (void)saleTickets {
    while (1) {
        [NSThread sleepForTimeInterval:1.0];
        /*
         互斥锁：保证锁内的代码，同一时间只有1个线程执行
         互斥锁的范围：尽量要小，范围大效率就会差
         
         */
        
        @synchronized (_lockObj) {
            if (self.tickets>0) {
                self.tickets--;
                NSLog(@"还剩%d张票  %@", self.tickets, [NSThread currentThread]);
            }else {
                NSLog(@"买完了");
                break;
            }

        }
        
    }
}
@end
