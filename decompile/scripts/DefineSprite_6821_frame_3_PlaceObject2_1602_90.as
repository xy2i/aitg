//! status=pending
on(release){
   if(_root.save.arcadeDifficulty[1] < 3)
   {
      _root.save.arcadeDifficulty[1] += 1;
   }
   else if(_root.save.arcadeDifficulty[1] < 4)
   {
      if(_root.arcadeTmpRatingGame[1][0] + _root.arcadeTmpRatingGame[1][1] + _root.arcadeTmpRatingGame[1][2] >= 300)
      {
         _root.save.arcadeDifficulty[1] += 1;
      }
      else
      {
         _root.showPopup("Locked!","Achieve a Rating of 3.00 in this game to unlock ANOTHER difficulty!");
      }
   }
}


onClipEvent(enterFrame){
   if(_root.save.arcadeDifficulty[1] < 4)
   {
      _alpha = 100;
   }
   else
   {
      _alpha = 30;
   }
}


onClipEvent(load){
   if(_root.save.arcadeDifficulty[1] < 4)
   {
      _alpha = 100;
   }
   else
   {
      _alpha = 30;
   }
}


