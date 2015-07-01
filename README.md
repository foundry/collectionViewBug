# collectionViewBug
Demo of collectionView bug when UINavigationBar is translucent


I am designing a UICollectionViewController to use as a tab bar control. I've found some strange behaviour when embedding in a UINavigationController.

This is what we want:

<img src = "https://github.com/foundry/collectionViewBug/blob/master/screendumps/good.png">

Each grey step represents a tab cell...

If the Navigation Bar translucent property is set to YES,  this is what we get:

<img src = "https://github.com/foundry/collectionViewBug/blob/master/screendumps/bad.png">

In the demo you can switch between translucent/opaque and use of frames/autolayout with a couple of switches:

<img src = "https://github.com/foundry/collectionViewBug/blob/master/screendumps/switch.png">

Any suggestions gratefully received.





