//
//  AppDelegate.m
//  AspectsSample
//
//  Created by 大島 雅人 on 2014/05/10.
//
//

#import "AppDelegate.h"
#import "Aspects.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSError *error = nil;
    [UIViewController aspect_hookSelector:@selector(viewWillAppear:)
                              withOptions:AspectPositionBefore
                               usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
                                   UIViewController *vc = [aspectInfo instance];
                                   NSArray *args = [aspectInfo arguments];
                                   
                                   NSLog(@"viewWillAppearが呼ばれる前にインターセプト");
                                   NSLog(@"呼ばれたインスタンス:%@", vc);
                                   NSLog(@"呼ばれたメソッドの引数の数:%ld", [args count]);
                                   NSLog(@"配列の中身はボクシングされている:%@", [[args firstObject] class]);
                                   NSLog(@"引数が分かっていれば直接ブロックの引数でも取得可能:%@", animated ? @"YES":@"NO");
                               }
                                    error:&error];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
