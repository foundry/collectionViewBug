//
//  ViewController2.m
//  UICollectionViewBug
//
//  Created by jonathan on 01/07/2015.
//  Copyright (c) 2015 ellipsis. All rights reserved.
//

#import "ViewController2.h"
#import "WNTabControllerHostVC.h"
#import "AppDelegate.h"

@interface ViewController2 ()
@property (nonatomic, strong) UISwitch* useAutoLayout;
@property (nonatomic, strong) UISwitch* transparentNavBar;
@property (nonatomic, strong) UILabel* switch1Label;
@property (nonatomic, strong) UILabel* switch2Label;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem* rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self  action:@selector(pushVC)];
    self.navigationItem.rightBarButtonItem = rightItem;
    [self setupButtons];
    [self arrangeLayout];
}

- (void)setupButtons {
    self.useAutoLayout= [[UISwitch alloc] init];
    self.transparentNavBar = [[UISwitch alloc] init];
    self.switch1Label = [[UILabel alloc] init];
    self.switch2Label = [[UILabel alloc] init];
    [self.view addSubview:self.useAutoLayout];
    [self.view addSubview:self.transparentNavBar];
    [self.view addSubview:self.switch1Label];
    [self.view addSubview:self.switch2Label];
    self.switch1Label.text = @"autolayout";
    self.switch2Label.text = @"translucent nav bar";
    self.switch2Label.textAlignment = NSTextAlignmentLeft;
    self.switch1Label.textAlignment = NSTextAlignmentLeft;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)pushVC {
    AppDelegate* appDelegate  = [[UIApplication sharedApplication] delegate];
    appDelegate.useAutoLayout = self.useAutoLayout.on;
    appDelegate.translucentBar = self.transparentNavBar.on;
    self.navigationController.navigationBar.translucent = self.transparentNavBar.on;
    UIViewController* host = [[WNTabControllerHostVC alloc] init];
    [self.navigationController pushViewController:host animated:YES];

}

- (void)arrangeLayout {
    self.useAutoLayout.translatesAutoresizingMaskIntoConstraints=NO;
    self.transparentNavBar.translatesAutoresizingMaskIntoConstraints   = NO;
    self.switch1Label.translatesAutoresizingMaskIntoConstraints=NO;
    self.switch2Label.translatesAutoresizingMaskIntoConstraints=NO;
    CGFloat barHeight =  self.navigationController.navigationBar.bounds.size.height;
    NSString* formatV1 = @"V:|-(240)-[s1]-[s2]";
    NSString* formatV2 = @"V:|-(240)-[l1(31)]-[l2(31)]";

    NSString* formatH1 = @"H:|-(60)-[s1(50)]-(10)-[l1(100)]";
    NSString* formatH2 = @"H:|-(60)-[s2(50)]-(10)-[l2]";

    NSDictionary* metrics =@{};
    NSDictionary* views = @{@"s1":self.useAutoLayout
                            ,@"s2":self.transparentNavBar
                            ,@"l1":self.switch1Label
                            ,@"l2":self.switch2Label};
    for (NSString* format in @[formatV1,formatV2, formatH1, formatH2]) {
        [self.view addConstraints:
         [NSLayoutConstraint constraintsWithVisualFormat:format
                                                 options:0
                                                 metrics:metrics
                                                   views:views]];
    }
}


@end
