//
//  WNNotificationsVC.m
//  Wondr
//
//  Created by jonathan on 30/06/2015.
//  Copyright (c) 2015 Wondr.it Ltd. All rights reserved.
//

#import "TabControllerHostVC.h"
#import "TabController.h"
#import "AppDelegate.h"
@interface TabControllerHostVC ()
@property (nonatomic, strong) TabController* tabController;
@property (nonatomic, assign) BOOL useAutoLayout;
@property (nonatomic, assign) BOOL translucentBar;

@end

@implementation TabControllerHostVC

- (void)viewDidLoad {
    self.title = NSStringFromClass(self.class);
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    self.useAutoLayout = appDelegate.useAutoLayout;
    self.translucentBar = appDelegate.translucentBar;
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationController.navigationBar.translucent = self.translucentBar;

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupTabBar];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}


- (void)setupTabBar {
    NSLog(@"%s",__FUNCTION__);

    self.tabController = [[TabController alloc] init];
    NSLog(@"%@",self.tabController.view);
    if (self.useAutoLayout) {
        
        [self addChildViewController:self.tabController];
        [self.view addSubview:self.tabController.view];
        [self.tabController didMoveToParentViewController:self];
        [self setupConstraints];

    } else {
        CGFloat width = self.view.bounds.size.width;
        CGFloat barHeight =  self.navigationController.navigationBar.bounds.size.height;
        CGFloat originY = self.translucentBar? barHeight+20:0;
        CGRect frame = CGRectMake(0, originY, width, barHeight);
        self.tabController.collectionView.frame = frame;
        [self addChildViewController:self.tabController];
        [self.view addSubview:self.tabController.collectionView];
        [self.tabController didMoveToParentViewController:self];

    }
    NSLog(@"%@",self.tabController.view);
    
}


- (void)setupConstraints {
    CGFloat barHeight =  self.navigationController.navigationBar.bounds.size.height;
    CGFloat originY = self.translucentBar? barHeight:-20;
    self.tabController.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    NSString* formatV = @"V:|-(originY)-[view(barHeight)]";
    NSString* formatH = @"H:|[view]|";
    NSDictionary* metrics =@{@"originY":@(originY)
                             ,@"barHeight":@(barHeight)};
    NSDictionary* views = @{@"view":self.tabController.collectionView};
    for (NSString* format in @[formatV, formatH]) {
        [self.view addConstraints:
         [NSLayoutConstraint constraintsWithVisualFormat:format
                                                 options:0
                                                 metrics:metrics
                                                   views:views]];
    }
}





@end
