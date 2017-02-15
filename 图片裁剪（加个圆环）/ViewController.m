//
//  ViewController.m
//  图片裁剪（加个圆环）
//
//  Created by 上海均衡 on 2017/1/22.
//  Copyright © 2017年 上海均衡. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //1、加载图片
    UIImage *image=[UIImage imageNamed:@"123"];
    //图片的高度、宽度
    CGFloat imageWH=image.size.width;
    CGFloat border=4;
    //外部圆环的高度和宽度
    CGFloat oval=imageWH+2*border;
    //2、开启一个图片上下文
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(oval, oval), NO, 0);
    //画大圆
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, oval, oval)];
    [[UIColor redColor] set];
    [path fill];
    //设置裁剪区域
    UIBezierPath *clippath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(border, border, imageWH, imageWH)];
    [clippath addClip];
    //绘制
    [image drawAtPoint:CGPointMake(border, border)];
    //获取图片
    UIImage *lastImage=UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    //显示图片
    self.imageView.image=lastImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
