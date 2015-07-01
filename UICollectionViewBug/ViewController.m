//
//  ViewController.m
//  UICollectionViewBug
//
//  Created by jonathan on 30/06/2015.
//  Copyright (c) 2015 ellipsis. All rights reserved.
//

#import "ViewController.h"
#import "TabControllerHostVC.h"
#import "StartVC.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self pushVC];
    
}

- (void)presentVC {
    UIViewController* host = [[StartVC alloc] init];
    [self presentViewController:host animated:YES completion:NULL];
}

- (void)pushVC {
    UIViewController* host = [[StartVC alloc] init];
    UINavigationController* navCon = [[UINavigationController alloc] initWithRootViewController:host];
    navCon.navigationBar.translucent = TRANSLUCENT_BAR;
    [self presentViewController:navCon animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
