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

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.hoge = [[Hoge alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.hoge aspect_hookSelector:@selector(setFuga:)
                       withOptions:AspectPositionAfter
                        usingBlock:^(id<AspectInfo> info, NSString *fuga) {
                            Hoge *hoge = [info instance];
                            NSLog(@"setFuge:が呼ばれたときのスタックトレース");
                            NSLog(@"%@", [NSThread callStackSymbols]);
                            NSLog(@"インスタンス:%@", hoge);
                            NSLog(@"引数:%@", fuga);
                        }
                             error:nil];
    
    [self.hoge aspect_hookSelector:@selector(performWithArg1:andArg2:)
                       withOptions:AspectPositionAfter
                        usingBlock:^(id<AspectInfo> info, NSString *arg1, NSNumber *arg2) {
                            Hoge *hoge = [info instance];
                            NSLog(@"performWithArg1:andArg2: 引数が複数の場合");
                            NSLog(@"%@ arg1:%@ arg2:%ld", hoge, arg1, [arg2 integerValue]);
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
    
    [self.hoge performWithArg1:@"引数1" andArg2:@22222];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
