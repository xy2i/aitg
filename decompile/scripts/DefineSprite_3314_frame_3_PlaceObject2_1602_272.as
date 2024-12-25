//! status=pending
on(dragOver,rollOver){
   _root.actiondescription = "Hold SHIFT and click this button to destroy all of your trees. Note that once your trees are destroyed, there is no coming back.";
}


on(release){
   if(Key.isDown(16))
   {
      if(_root.saveid == 23)
      {
         _root.showPopup("NOOOOOOOOO!","You must resist your urges. You don\'t want to fail the challenge, do you?");
      }
      else
      {
         tempCap = _root.save.gardenCapacity;
         if(_root.save.gardenCapacity > 75)
         {
            tempCap = 75;
         }
         if(tempCap >= 51)
         {
            i = 51;
            while(i <= tempCap)
            {
               if(_root.save.gardenTrees[i] > 0)
               {
                  _root.save.curForestDestroyer += 1;
                  if(_root.save.forestDestroyer < _root.save.curForestDestroyer)
                  {
                     _root.save.forestDestroyer = _root.save.curForestDestroyer;
                  }
                  _root.save.gardenTrees[i] = 0;
               }
               i++;
            }
         }
      }
   }
}


on(rollOut,dragOut){
   _root.actiondescription = "";
}

