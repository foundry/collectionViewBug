//
//  ViewController.m
//  UICollectionViewBug
//
//  Created by jonathan on 30/06/2015.
//  Copyright (c) 2015 ellipsis. All rights reserved.
//

#import "ViewController.h"
#import "WNTabControllerHostVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)showCollectionView:(id)sender {
    UIViewController* host = [[WNTabControllerHostVC alloc] init];
    [self presentViewController:host animated:YES completion:NULL];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
