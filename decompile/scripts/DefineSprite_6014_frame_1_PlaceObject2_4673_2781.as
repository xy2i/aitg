//! status=pending
onClipEvent(enterFrame){
   del += 1;
   if(del >= 40)
   {
      del = 0;
      if(_root.save.arenaSP >= 50)
      {
         flashing = true;
      }
      else if(_alpha == 0)
      {
         flashing = false;
      }
      if(flashing == true)
      {
         time += 1;
         if(time >= 1)
         {
            _alpha = 100;
         }
         if(time >= 2)
         {
            _alpha = 0;
            time = 0;
         }
      }
   }
}


onClipEvent(load){
   _alpha = 0;
   flashing = false;
   time = 0;
   del = 0;
}

