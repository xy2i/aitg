//! status=pending
onClipEvent(enterFrame){
   if(_root.gCheck == true)
   {
      checkFrame();
   }
}


onClipEvent(load){
   function checkFrame()
   {
      gotoAndStop(_parent._parent.frame);
   }
   this.setMask(_parent.itemMark);
   checkFrame();
}

