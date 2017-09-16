//
//  ViewController.m
//  保存图片
//
//  Created by Stephen on 2017/9/16.
//  Copyright © 2017年 Stephen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (weak, nonatomic  ) UIImageView *imgView;

@property (nonatomic, strong) UIImage *image;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.scrollView.delegate = self;
    self.scrollView.minimumZoomScale = 0.5;
    self.scrollView.maximumZoomScale = 2.0;
    self.view = self.scrollView;
    
    UIImageView *iv = [[UIImageView alloc]init];
    [self.view addSubview:iv];
    self.imgView = iv;
    
    //[self downImage];
    
    NSThread *t1 = [[NSThread alloc]initWithTarget:self selector:@selector(downImage) object:nil];
    [t1 start];
}


- (void)downImage {
    
    NSURL *url = [NSURL URLWithString:@"https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2877441215,2220934533&fm=11&gp=0.jpg"];
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    UIImage *image = [UIImage imageWithData:data];
    
    self.image = image;
    
    //回到主线程 刷新UI
    [self performSelector:@selector(setImage:) withObject:image afterDelay:NO];
}


- (void)setImage:(UIImage *)image {
    
    self.imgView.image = image;
    [self.imgView sizeToFit];
    self.scrollView.contentSize = image.size;
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imgView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSLog(@"-----%@", NSStringFromCGAffineTransform(self.imgView.transform));
}
@end
