# collectionViewBug
Demo of collectionView bug when UINavigationBar is translucent


I am designing a UICollectionViewController to use as a tab bar control. I've found some strange behaviour when embedding in a UINavigationController.

<table><tr><td>
This is what we want:
</td><td>This is what we get:</td></tr>
<tr><td><img src = "https://github.com/foundry/collectionViewBug/blob/master/screendumps/good.png">
</td><td>
 <img src = "https://github.com/foundry/collectionViewBug/blob/master/screendumps/bad.png">
 </td></tr></table>

Each grey step represents a tab cell...

If the Navigation Bar translucent property is set to YES,  this is what we get:



In the demo you can switch between translucent/opaque and use of frames/autolayout with a couple of switches:

<img src = "https://github.com/foundry/collectionViewBug/blob/master/screendumps/switch.png">

Any suggestions gratefully received.





