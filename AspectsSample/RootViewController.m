//
//  RootViewController.m
//  AspectsSample
//
//  Created by 大島 雅人 on 2014/05/10.
//
//

#import "RootViewController.h"
#import "Hoge.h"
#import "Aspects.h"

@interface RootViewController ()

@property (nonatomic) Hoge *hoge;

@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.hoge = [[Hoge alloc] init];
    [self.hoge aspect_hookSelector:@selector(setFuga:)
                       withOptions:AspectPositionAfter
                        usingBlock:^(id instance, NSArray *args) {
                            Hoge *hoge = instance;
                            NSString *fuga = [args firstObject];
                            NSLog(@"%@\n%@ set: %@",  [NSThread callStackSymbols], hoge, fuga);
                        }
                             error:nil];
    self.hoge.fuga = @"hogehoge";
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.hoge.fuga = @"fugafuga";
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.hoge.fuga = @"piyopiyo";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
