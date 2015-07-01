# collectionViewBug
Demo of collectionView bug when UINavigationBar is translucent


I am designing a UICollectionViewController to use as a tab bar control. I've found some strange behaviour when embedding in a UINavigationController.

<table><tr><td>
This is what we want:<br>each grey step is a UICollectionViewCell:
</td><td>This is what we get: <br>when navigationBar.translucent =  YES</td></tr>
<tr><td><img src = "https://github.com/foundry/collectionViewBug/blob/master/screendumps/good.png">
</td><td>
 <img src = "https://github.com/foundry/collectionViewBug/blob/master/screendumps/bad.png">
 </td></tr></table>

The cell dequeuing method. 

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath

Does not get called when the navigationBar is translucent, so no cells are added to the collectionView.

The earlier datasource methods

     - (NSInteger)collectionView:(UICollectionView *)view 
          numberOfItemsInSection:(NSInteger)section
          
     - (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView
     
 Do get called in the broken case. 





In the demo you can switch between translucent/opaque and use of frames/autolayout with a couple of switches:

<img src = "https://github.com/foundry/collectionViewBug/blob/master/screendumps/switch.png">

Any suggestions gratefully received.





