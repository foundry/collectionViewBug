# collectionViewBug
Demo of collectionView bug when UINavigationBar is translucent

    [[[[[[[[[[[[  FIXED  ]]]]]]]]]]]   

 - in the parent viewController     
     
         self.automaticallyAdjustsScrollViewInsets = NO;
       
From the docs...       
>Default value is YES, which allows the view controller to adjust its scroll view insets in response to the screen areas consumed by the status bar, navigation bar, and toolbar or tab bar. Set to NO if you want to manage scroll view inset adjustments yourself, such as when there is more than one scroll view in the view hierarchy.
      
 I didn't recognise the issue, as the collectionView height was the same as the top contentInset. Thats why cellForRowAtIndexPath didn’t get called, there was no display area   

______________   



I am designing a UICollectionViewController to use as a tab bar control, but getting stuck with some strange behaviour when embedding in a UINavigationController.

<table><tr><td>
This is what we want:<br>each grey step is a UICollectionViewCell:
</td><td>This is what we get: <br>when navigationBar.translucent =  YES</td></tr>
<tr><td><img src = "https://github.com/foundry/collectionViewBug/blob/master/screendumps/good.png">
</td><td>
 <img src = "https://github.com/foundry/collectionViewBug/blob/master/screendumps/bad.png">
 </td></tr></table>

The cell dequeuing method

      - (UICollectionViewCell *)collectionView:(UICollectionView *)cv
                        cellForItemAtIndexPath:(NSIndexPath *)indexPath

Does not get called when the navigationBar is translucent, so no cells are added to the collectionView.

On the other hand the earlier datasource methods

     - (NSInteger)collectionView:(UICollectionView *)view 
          numberOfItemsInSection:(NSInteger)section
          
     - (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
     
 Do get called in both the broken and the good case.





In the demo you can switch between translucent/opaque and use of frames/autolayout with a couple of switches:

<img src = "https://github.com/foundry/collectionViewBug/blob/master/screendumps/switch.png">

I added an autolayout switch because at first I suspected this had something to do with it (the usual suspect). But actually it makes no difference.

[autolayout switch removed in latest version]

Tested in iOS7.1 and iOS8.3

Any suggestions gratefully received.






