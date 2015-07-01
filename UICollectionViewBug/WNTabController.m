//
//  WNFilterPickerCVC.m
//  Wondr
//
//  Created by jonathan on 04/07/2014.
//  Copyright (c) 2014 Wondr.it Ltd. All rights reserved.
//

#import "WNTabController.h"


@interface WNTabController ()< UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@end

@implementation WNTabController
- (instancetype) init {
    NSLog(@"%s",__FUNCTION__);

    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];
    self = [self initWithCollectionViewLayout:layout];
    if (self) {
        [self.collectionView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"Cell"];
    }
    return self;

}
- (instancetype) initWithCollectionViewLayout:(UICollectionViewLayout*)layout {
    NSLog(@"%s",__FUNCTION__);
    
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        [self.collectionView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"Cell"];
    }
    return self;
}


- (void)viewDidload {
    NSLog(@"%s",__FUNCTION__);


    [super viewDidLoad];
    [self setupCollectionView];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%s",__FUNCTION__);

    [super viewWillAppear:animated];
    [self.collectionView reloadData];

}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"%s",__FUNCTION__);

    [super viewDidAppear:animated];

}


- (void)setupCollectionView {
    NSLog(@"%s",__FUNCTION__);
    self.collectionView.delaysContentTouches = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;

}



#pragma mark - UICollectionView Datasource

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section {
    NSLog(@"%s",__FUNCTION__);

    return 10;

}

- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    NSLog(@"%s",__FUNCTION__);

    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%s",__FUNCTION__);

    UICollectionViewCell* cell =[cv dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];

    cell.backgroundColor = [UIColor colorWithWhite:(indexPath.row+1)/((float)[self.collectionView numberOfItemsInSection:0]) alpha:1];
    return cell;
}

#pragma mark - flowlayout delegate

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.bounds.size.width/(float)[self.collectionView numberOfItemsInSection:0], collectionView.bounds.size.height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}



@end
