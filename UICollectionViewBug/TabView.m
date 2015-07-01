//
//  TabView.m
//  UICollectionViewBug
//
//  Created by jonathan on 01/07/2015.
//  Copyright (c) 2015 ellipsis. All rights reserved.
//

#import "TabView.h"
@interface TabView()< UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>\

@property (nonatomic, strong) UICollectionView* collectionView;
@property (nonatomic, strong) UICollectionViewLayout* collectionViewLayout;
@end

@implementation TabView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self ) {
        [self initialise];
    }
    return self;
}

- (void)initialise {
    UICollectionViewFlowLayout* layout = [[UICollectionViewFlowLayout alloc] init];

    self.collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
    self.collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self setupCollectionView];
    [self addSubview:self.collectionView];
    [self.collectionView reloadData];

}

- (void)setupCollectionView {
    NSLog(@"%s",__FUNCTION__);
    [self.collectionView registerClass:UICollectionViewCell.class forCellWithReuseIdentifier:@"Cell"];
    self.collectionView.delaysContentTouches = NO;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    NSLog(@"edgeInsets: %@",NSStringFromUIEdgeInsets(self.collectionView.contentInset));
          
}

- (UICollectionViewLayout*)collectionViewLayout {
    return self.collectionView.collectionViewLayout;
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
