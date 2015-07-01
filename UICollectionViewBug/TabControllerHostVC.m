//
//  WNNotificationsVC.m
//  Wondr
//
//  Created by jonathan on 30/06/2015.
//  Copyright (c) 2015 Wondr.it Ltd. All rights reserved.
//

#import "TabControllerHostVC.h"
#import "TabController.h"
#import "TabView.h"

@interface TabControllerHostVC ()
@property (nonatomic, strong) TabController* tabController;
@property (nonatomic, strong) TabView* tabView;

@end

@implementation TabControllerHostVC

- (void)viewDidLoad {
    self.title = NSStringFromClass(self.class);
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.navigationController.navigationBar.translucent = self.translucentBar;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (self.useCollectionViewController) {
       [self setupTabBar];
    } else {
    [self setupTabView];
    }

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}

- (void)setupTabView {
    NSLog(@"%s",__FUNCTION__);
    self.tabView = [[TabView alloc] init];
    self.tabView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.tabView];
    CGFloat originY = self.translucentBar? self.navigationController.navigationBar.bounds.size.height+20:0;
    [self setupConstraintsWithOriginY:originY];
    
}

- (void)setupTabBar {
    NSLog(@"%s",__FUNCTION__);

    self.tabController = [[TabController alloc] init];
    NSLog(@"%@",self.tabController.view);
    
    //comparing use of autolayout and frames
    //makes no difference to the issue
    
    if (self.useAutoLayout) {
        
        [self addChildViewController:self.tabController];
        [self.view addSubview:self.tabController.view];
        [self.tabController didMoveToParentViewController:self];
        CGFloat originY = self.translucentBar? self.navigationController.navigationBar.bounds.size.height+60: -20;
        [self setupConstraintsWithOriginY:originY];

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


- (void)setupConstraintsWithOriginY:(CGFloat)originY {
    NSLog(@"toplayoutguide %f",self.topLayoutGuide.length);

    CGFloat barHeight =  self.navigationController.navigationBar.bounds.size.height*3;
  
    
    self.tabController.collectionView.translatesAutoresizingMaskIntoConstraints = NO;
    NSString* formatV = @"V:|-(originY)-[view(barHeight)]";
    NSString* formatH = @"H:|[view]|";
    NSDictionary* metrics =@{@"originY":@(originY)
                             ,@"barHeight":@(barHeight)};
    NSDictionary* views = @{};
    if (self.tabController) {
        views = @{@"view":self.tabController.collectionView};
    } else if (self.tabView) {
        views = @{@"view":self.tabView};
    }
    for (NSString* format in @[formatV, formatH]) {
        [self.view addConstraints:
         [NSLayoutConstraint constraintsWithVisualFormat:format
                                                 options:0
                                                 metrics:metrics
                                                   views:views]];
    }
}





@end
