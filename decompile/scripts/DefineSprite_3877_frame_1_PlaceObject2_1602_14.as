//! status=pending
on(release){
   _root.save.greed = 1337;
   if(_root.save.freeBacon1 > 0)
   {
      _root.incDt2();
      _parent._parent.stuffHolder.attachMovie("newLoot17","newLoot" + _root.summonCount,_root.antiLag2 + 500,{x:170,y:150,lootValue:_root.save.freeBacon1});
   }
   _root.save.freeBacon1 = 0;
}


