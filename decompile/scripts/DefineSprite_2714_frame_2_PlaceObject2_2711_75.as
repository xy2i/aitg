//! status=pending
onClipEvent(enterFrame){
   if(_parent.featureDropdown._y < -5 && _alpha < 100)
   {
      _alpha = _alpha + 20;
   }
   else if(_parent.featureDropdown._y >= -5 && _alpha > 0)
   {
      _alpha = _alpha - 20;
   }
   if(this.hitTest(_root.cursor) && _alpha > 0)
   {
      gotoAndStop(2);
      h = true;
      _parent.featureDropdown.yspeed -= 1;
   }
   else if(h == true)
   {
      h = false;
      gotoAndStop(1);
   }
}


onClipEvent(load){
   _alpha = 0;
}

