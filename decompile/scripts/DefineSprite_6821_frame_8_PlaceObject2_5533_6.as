//! status=pending
on(keyPress "D"){
   _parent.pframe = 46;
}


on(release){
   if(_root.save.rankedMode == true)
   {
      tokenCost = 4;
   }
   else
   {
      tokenCost = 0;
   }
   if(_root.save.arcadeToken >= tokenCost)
   {
      _root.save.arcadeToken -= tokenCost;
      _parent.pframe = 26;
      _parent.gotoAndStop(20);
   }
}


