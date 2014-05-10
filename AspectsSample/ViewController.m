//
//  ViewController.m
//  AspectsSample
//
//  Created by 大島 雅人 on 2014/05/10.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"superのUIViewControllerを呼び出す前 %@ animated:%d", self, animated);
    [super viewWillAppear:animated];
    NSLog(@"superのUIViewControllerを呼び出した後 %@ animated:%d", self, animated);
    NSLog(@"UIViewControllerのサブクラスであるViewControllerのviewWillAppear %@ animated:%d", self, animated);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
