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

@property (atomic, strong) NSObject *myAtomic;

@end

/*
    原子属性：如果不写atomatic，多线程写入属性时，保证同一个时间只有一个线程能够写入操作，单线程写，多线程读。
    线程安全：多个线程操作数据，仍然能保证数据正确
    实际上，原子属性内部会有一把锁：自旋锁
 
    共同点：同一时间，只有线程访问
    不同点:
        互斥锁：如果发现其他线程正在执行锁定的代码，线程就会进入休眠状态，等待线程完成，就唤醒
        自旋锁：如果发现其他线程还在执行锁定的代码，线程就会死循环模式，等待线程完成，就执行锁定代码
 
 */
@implementation ViewController

@synthesize myAtomic = _myAtomic;

- (NSObject *)myAtomic {
    return _myAtomic;
}
- (void)setMyAtomic:(NSObject *)myAtomic {
    @synchronized (self) {
        _myAtomic = myAtomic;
    }
    
}

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
