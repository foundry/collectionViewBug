//
//  WNNotificationsVC.m
//  Wondr
//
//  Created by jonathan on 30/06/2015.
//  Copyright (c) 2015 Wondr.it Ltd. All rights reserved.
//

#import "WNTabControllerHostVC.h"
#import "WNTabController.h"

@interface WNTabControllerHostVC ()
@property (nonatomic, strong) WNTabController* tabController;

@end

@implementation WNTabControllerHostVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationController.navigationBar.translucent = NO;
   // [self setupTabBar];
   // [self.tabController selectTab:WNNotificationsTabAll];

    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self setupTabBar];

}

#define FRAMES 0

- (void)setupTabBar {
    NSLog(@"%s",__FUNCTION__);
    UICollectionViewLayout* layout = [[UICollectionViewFlowLayout alloc] init];

    self.tabController = [[WNTabController alloc] initWithCollectionViewLayout:layout];
    NSLog(@"%@",self.tabController.view);
    if (FRAMES) {
        [self setupTabBarWithFrame:CGRectMake(0, 64, 320, 64)];
        [self addChildViewController:self.tabController];
        [self.view addSubview:self.tabController.collectionView];
        [self.tabController didMoveToParentViewController:self];
    } else {
        [self addChildViewController:self.tabController];
        [self.view addSubview:self.tabBarController.view];
        [self.tabController didMoveToParentViewController:self];
        [self setupTabBarWithAutolayout];
    }
    NSLog(@"%@",self.tabController.view);
    
}

- (void)setupTabBarWithFrame:(CGRect)frame {
    self.tabBarController.view.frame = frame;
}
- (void)setupTabBarWithAutolayout {
    self.tabController.view.translatesAutoresizingMaskIntoConstraints = NO;
    NSString* formatV = @"V:|[view(==64)]";
    NSString* formatH = @"H:|[view]|";
    UIView* view = self.tabBarController.view;
    for (NSString* format in @[formatV, formatH]) {
        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:format options:0 metrics:nil views:@{@"view":view}]];
    }
}





@end
