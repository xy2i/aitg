//! status=pending
onClipEvent(load){
   function checkFrame()
   {
      if(_parent.type == "Weapon")
      {
         gotoAndStop(2);
      }
      else if(_parent.subtype == "Hat")
      {
         gotoAndStop(3);
      }
      else if(_parent.subtype == "Shirt")
      {
         gotoAndStop(4);
      }
      else if(_parent.subtype == "Gloves")
      {
         gotoAndStop(5);
      }
      else if(_parent.subtype == "Pants")
      {
         gotoAndStop(6);
      }
      else if(_parent.subtype == "Shoes")
      {
         gotoAndStop(7);
      }
      else if(_parent.subtype == "Weapon")
      {
         gotoAndStop(2);
      }
      else if(_parent.subtype == "Skin")
      {
         gotoAndStop(14);
      }
      else if(_parent.subtype == "Medal")
      {
         gotoAndStop(9);
      }
      else if(_parent.subtype == "Pendant")
      {
         gotoAndStop(11);
      }
      else if(_parent.subtype == "Earring")
      {
         gotoAndStop(12);
      }
      else if(_parent.subtype == "Trinket")
      {
         gotoAndStop(13);
      }
      else if(_parent.type == "Enhancer")
      {
         gotoAndStop(8);
      }
      else if(_parent.type == "Potion")
      {
         gotoAndStop(10);
      }
      else if(_parent.type == "Chip")
      {
         gotoAndStop(15);
      }
      bonuspow = _parent.bonusPow;
      if(isNaN(bonuspow))
      {
         bonuspow = 0;
      }
      if(bonuspow >= 706)
      {
         fr = 10;
      }
      else if(bonuspow >= 406)
      {
         fr = 9;
      }
      else if(bonuspow >= 256)
      {
         fr = 8;
      }
      else if(bonuspow >= 156)
      {
         fr = 7;
      }
      else if(bonuspow >= 106)
      {
         fr = 6;
      }
      else if(bonuspow >= 66)
      {
         fr = 5;
      }
      else if(bonuspow >= 36)
      {
         fr = 4;
      }
      else if(bonuspow >= 16)
      {
         fr = 3;
      }
      else if(bonuspow >= 1)
      {
         fr = 2;
      }
      else
      {
         fr = 1;
      }
      if(powDisp._currentframe != fr)
      {
         powDisp.gotoAndStop(fr);
      }
   }
   checkFrame();
}

