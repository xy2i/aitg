//! status=pending
on(release){
   _root.save.fcgCash += 2500;
   _root.save.fcgInitDeck = 5;
   _parent.gotoAndStop(2);
}


on(rollOver){
   _alpha = 50;
}


onClipEvent(enterFrame){
   if(_alpha > 10)
   {
      _alpha = _alpha - 2;
   }
}


onClipEvent(load){
   _alpha = 0;
}


