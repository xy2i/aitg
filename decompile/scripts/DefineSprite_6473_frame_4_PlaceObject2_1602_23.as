//! status=pending
on(release,keyPress "2"){
   _root.problemDisp = _parent.firstNum + " / " + _parent.secondNum + " = <font color=\'#FFFF00\'>" + _parent.choice2.text + "</font>";
   if(_parent.corAnswer == 2)
   {
      _parent._parent.correct();
   }
   else
   {
      _parent._parent.wrong();
   }
}

