//! status=pending
onClipEvent(enterFrame){
   if(_parent._parent.enemy.stun > 0)
   {
      fr = 1;
   }
   else
   {
      fr = 2;
   }
   if(_currentframe != fr)
   {
      gotoAndStop(fr);
   }
}

