//! status=pending
on(release,keyPress "2"){
   _root.problemDisp = _parent.firstNumText.text + " <font color=\'#FFFF00\'>-</font> " + _parent.secondNumText.text + " = " + _parent.finalNumText.text;
   if(_parent.firstNum - _parent.secondNum == _parent.finalNum)
   {
      _parent._parent.correct();
   }
   else
   {
      _parent._parent.wrong();
   }
}

