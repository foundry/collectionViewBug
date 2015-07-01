//
//  ViewController2.m
//  UICollectionViewBug
//
//  Created by jonathan on 01/07/2015.
//  Copyright (c) 2015 ellipsis. All rights reserved.
//

#import "StartVC.h"
#import "TabControllerHostVC.h"
#import "AppDelegate.h"

@interface StartVC ()
@property (nonatomic, strong) IBOutlet UISwitch* useAutoLayout;
@property (nonatomic, strong) IBOutlet UISwitch* transparentNavBar;
@property (weak, nonatomic) IBOutlet UISwitch *useCollectionViewController;
@property (weak, nonatomic) IBOutlet UISwitch *autoAdjustScrollViewInsets;

@property (nonatomic, strong) UILabel* switch1Label;
@property (nonatomic, strong) UILabel* switch2Label;
@end

@implementation StartVC

- (void)viewDidLoad {
    self.title = NSStringFromClass(self.class);

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem* rightItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward
                                                  target:self
                                                  action:@selector(pushVC)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
}


- (void)pushVC {

    self.navigationController.navigationBar.translucent = self.transparentNavBar.on;
    TabControllerHostVC* host = [[TabControllerHostVC alloc] init];
    host.useAutoLayout = YES;
    host.translucentBar = self.transparentNavBar.on;
    host.useCollectionViewController = self.useCollectionViewController.on;
    host.automaticallyAdjustsScrollViewInsets = self.autoAdjustScrollViewInsets.on;
    [self.navigationController pushViewController:host animated:YES];

}


@end
