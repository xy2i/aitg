//! status=pending
on(release){
   if(_root.save.stadiumEnergy > 0)
   {
      _root.save.stadiumToken += Math.floor(_parent.evalCost(_root.save.stadiumAbilityCost - 1) / 4);
      _root.save.stadiumEnergy -= 1;
      _root.save.stadiumAbilityCost -= 1;
   }
}


