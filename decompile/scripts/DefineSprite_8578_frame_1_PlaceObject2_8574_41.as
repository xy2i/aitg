//! status=pending
onClipEvent(enterFrame){
   dotID1 = 3;
   dotID2 = 4;
   _X = _parent["dotx" + dotID1]._x;
   _Y = _parent["dotx" + dotID1]._y;
   _xscale = (_parent["dotx" + dotID2]._x - _parent["dotx" + dotID1]._x) * 10;
   _yscale = (_parent["dotx" + dotID2]._y - _parent["dotx" + dotID1]._y) * 10;
   if(_yscale >= 0 && _yscale < 1)
   {
      _yscale = 1;
   }
   if(_yscale < 0 && _yscale > -1)
   {
      _yscale = -1;
   }
}

