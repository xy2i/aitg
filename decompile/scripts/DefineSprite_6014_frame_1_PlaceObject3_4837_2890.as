//! status=pending
onClipEvent(enterFrame){
   if(tmpStreak != _root.challengeKill)
   {
      tmpStreak = _root.challengeKill;
      if(tmpStreak >= 1)
      {
         streakText.text = tmpStreak;
         if(tmpStreak >= 200)
         {
            gotoAndStop(6);
         }
         else if(tmpStreak >= 100)
         {
            gotoAndStop(5);
         }
         else if(tmpStreak >= 50)
         {
            gotoAndStop(4);
         }
         else if(tmpStreak >= 20)
         {
            gotoAndStop(3);
         }
         else if(tmpStreak >= 10)
         {
            gotoAndStop(2);
         }
         else
         {
            gotoAndStop(1);
         }
         _alpha = 100;
         _xscale = 140;
         _yscale = 140;
      }
   }
   if(_xscale > 100)
   {
      _xscale = _xscale - 4;
      _yscale = _yscale - 4;
   }
   if(tmpStreak < 1 && _alpha > 0)
   {
      _alpha = _alpha - 5;
      if(_alpha < 0)
      {
         _alpha = 0;
      }
   }
}


onClipEvent(load){
   _alpha = 0;
   tmpStreak = 0;
}


