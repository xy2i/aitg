//! status=pending
onClipEvent(enterFrame){
   alt = !alt;
   if(alt == true)
   {
      checkFrame();
   }
}


onClipEvent(load){
   function checkFrame()
   {
      if(_root.save.featureManualSprayer == true)
      {
         fr = 4;
      }
      else if(_root.save.level < reqLevel)
      {
         fr = 2;
      }
      else if(_root.save.greenCoin < coinCost)
      {
         fr = 3;
      }
      else
      {
         fr = 1;
      }
      if(_currentframe != fr)
      {
         gotoAndStop(fr);
      }
   }
   coinCost = 100000;
   reqLevel = 250;
   alt = false;
   checkFrame();
}

