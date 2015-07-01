//
//  ViewController.m
//  UICollectionViewBug
//
//  Created by jonathan on 30/06/2015.
//  Copyright (c) 2015 ellipsis. All rights reserved.
//

#import "ViewController.h"
#import "WNTabControllerHostVC.h"
#import "ViewController2.h"
#import "AppDelegate.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showCollectionView:(id)sender {
    [self pushVC];
    
}

- (void)presentVC {
    UIViewController* host = [[ViewController2 alloc] init];
    [self presentViewController:host animated:YES completion:NULL];
}

- (void)pushVC {
    UIViewController* host = [[ViewController2 alloc] init];
    UINavigationController* navCon = [[UINavigationController alloc] initWithRootViewController:host];
    navCon.navigationBar.translucent = TRANSLUCENT_BAR;
    [self presentViewController:navCon animated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
