//! status=pending
onClipEvent(enterFrame){
   loadPower();
   if(_root.arcadeTimeLeft > powerCost)
   {
      _alpha = 100;
   }
   else
   {
      _alpha = 30;
   }
}


onClipEvent(load){
   function loadPower()
   {
      powerType = 18;
      powerCost = 0;
      if(_root.focusTiletype != -1)
      {
         powerType = 3;
         powerCost = 40;
      }
      gotoAndStop(powerType);
   }
   loadPower();
}

