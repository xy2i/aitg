//! status=pending
onClipEvent(enterFrame){
   targetScale = _parent.field["stadiumEnemy" + _root.betTarget].energy / _parent.field["stadiumEnemy" + _root.betTarget].maxEnergy * 100;
   if(targetScale > 100)
   {
      targetScale = 100;
   }
   insideBar._xscale += (targetScale - insideBar._xscale) / 5;
}


onClipEvent(load){
   insideBar._xscale = 0;
   insideBar.gotoAndStop(3);
}


