//
//  ViewController.m
//  Viewtest
//
//  Created by 张储祺 on 2018/3/22.
//  Copyright © 2018年 张储祺. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIView * blackView ;
@property(nonatomic,strong) UIView * orangeView ;
//获取试图对象所有手势
/*
@property(nonatomic,strong) NSArray * gestureRecognizer ;
- (void)addGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer ;
- (void)removeGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer ;
 */
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction) ] ;
    [self.view addGestureRecognizer:longPress] ;



    //set black&orange property
    self.blackView = self.blackView ;
    self.orangeView = self.orangeView ;
    
    
    //greenview//subview of self.view
    UIView * green = [[UIView alloc]  init] ;
    green.tag = 0 ;
    green.frame = CGRectMake(100, 100, 200, 200);
    green.backgroundColor = [UIColor greenColor] ;
    [self.view addSubview:green] ;
    NSLog(@"greenview.frame:%@",NSStringFromCGRect(green.frame)) ;
    NSLog(@"greenview.bounds:%@",NSStringFromCGRect(green.bounds)) ;
    NSLog(@"greenview.center:%@",NSStringFromCGPoint(green.center)) ;
    
    //blue view//subview of greenview
    UIView * blue = [[UIView alloc] init] ;
    blue.tag = 1 ;
    blue.frame = CGRectMake(0, 0, 100, 100) ;
    blue.backgroundColor =[UIColor blueColor] ;
    [green addSubview:blue] ;
    
    //red view (back//subview of green
    UIView * red = [[UIView alloc] init] ;
    red.frame = CGRectMake(0, 0, 50, 50) ;
    red.backgroundColor = [UIColor redColor] ;

    [green addSubview:red] ;
    [green sendSubviewToBack:red] ;
    
}
//view property
-(UIView *)blackView{
    UIView * black = [[UIView alloc] initWithFrame:CGRectMake(300,0 , 50, 50)];
    black.backgroundColor = [UIColor blackColor] ;
    if(!_blackView)_blackView = black ;
    _blackView.tag = 5 ;
    [self.view addSubview:_blackView] ;
    return _blackView ;
}
-(UIView *)orangeView{
    UIView * orange = [[UIView alloc] initWithFrame:CGRectMake(300, 50, 50, 50)] ;
    orange.backgroundColor = [UIColor orangeColor] ;
    if(!_orangeView)_orangeView = orange ;
    _orangeView.tag = 6 ;
    [self.view addSubview:_orangeView] ;
    return _orangeView ;
}

- (IBAction)move:(id)sender {
    UIView * green ;
    for(UIView * view in self.view.subviews){
        if(view.backgroundColor ==[UIColor greenColor]){
            green = view ;
        }
    }
    
    CGPoint center = green.center ;
    center.x -= 10 ;
    green.center = center ;
    
}
- (IBAction)transform:(id)sender {
    UIView * blue ;
    for(UIView * view in [self.view subviews]){
        if(view.tag == 0){
            for(UIView * subsubview in [view subviews]){
                if(subsubview.tag == 1 ){
                    blue = subsubview ;
                    break ;
                }
            }
        }
    }
    
    blue.transform = CGAffineTransformScale(blue.transform, 1.1, 1.1) ;
}

- (IBAction)rotate:(id)sender {
    UIView * blue ;//
    for(UIView * view in [self.view subviews]){
        if(view.tag == 0){
            for(UIView * subsubview in [view subviews]){
                if(subsubview.tag == 1 ){
                    blue = subsubview ;
                    break ;
                }
            }
        }
    }
    
    blue.transform = CGAffineTransformRotate(blue.transform, M_PI/12) ;
}

- (IBAction)animation:(id)sender {
    [UIView animateWithDuration:3.0 delay:2.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         self.blackView.alpha = 0 ;
                         self.orangeView.alpha = 1 ;
                         CGPoint center = self.orangeView.center ;
                         center.y+=50 ;
                         self.orangeView.center = center ;
                     } completion:NULL] ;
    
}
//interaction
- (void)longPressAction{
    UIView * purpleView = [[UIView alloc] initWithFrame:CGRectMake(300, 300, 50, 50)] ;
    purpleView.backgroundColor = [UIColor purpleColor] ;
    purpleView.alpha = 0 ;
    [self.view addSubview:purpleView] ;
    
    [UIView animateWithDuration:1.5 delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         purpleView.alpha = 0.5 ;
                     }
                     completion:NULL] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
