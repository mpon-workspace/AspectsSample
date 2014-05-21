//
//  Hoge.m
//  AspectsSample
//
//  Created by 大島 雅人 on 2014/05/11.
//
//

#import "Hoge.h"

@implementation Hoge

- (void)performWithArg1:(NSString *)arg1 andArg2:(NSNumber *)arg2
{
    NSLog(@"%sarg1:%@ arg2:%@", __func__, arg1, arg2);
}

@end
