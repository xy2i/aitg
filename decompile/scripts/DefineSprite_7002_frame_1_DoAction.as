//! status=pending
function useItem(itemName, user)
{
   if(user == 0)
   {
      if(_root.save.questType == "Use Item")
      {
         if(_root.save.questSubtype == "Any" && itemName != "")
         {
            _root.save.questCount += 1;
         }
      }
      if(itemName == "Speed Boost")
      {
         stadiumHero.xspeed *= 1.8;
         stadiumHero.fastDur = 2;
      }
      if(itemName == "Energy Drain")
      {
         var _loc6_ = 1;
         while(_loc6_ <= 4)
         {
            this["stadiumEnemy" + _loc6_].energy -= 10;
            if(this["stadiumEnemy" + _loc6_].energy < 0)
            {
               this["stadiumEnemy" + _loc6_].energy = 0;
            }
            _loc6_ = _loc6_ + 1;
         }
         stadiumHero.energy += 40;
      }
      if(itemName == "Slow")
      {
         _loc6_ = 1;
         while(_loc6_ <= 4)
         {
            this["stadiumEnemy" + _loc6_].slowDur = 4;
            _loc6_ = _loc6_ + 1;
         }
      }
      if(itemName == "Stun")
      {
         _loc6_ = 1;
         while(_loc6_ <= 4)
         {
            this["stadiumEnemy" + _loc6_].stunDur = 2;
            _loc6_ = _loc6_ + 1;
         }
      }
      if(itemName == "Darkness")
      {
         _loc6_ = 1;
         while(_loc6_ <= 4)
         {
            this["stadiumEnemy" + _loc6_].darkDur = 5;
            _loc6_ = _loc6_ + 1;
         }
      }
      if(itemName != "")
      {
         kongName = _root.kongregate_username;
         if(kongName == undefined || kongName == "Guest")
         {
            kongName = _root.save.displayName;
         }
         _parent.breakStadium(kongName + " used " + itemName + "!");
         _root.dispNews(99,kongName + " used " + itemName + "!");
      }
      stadiumHero.curItem = "";
   }
   else
   {
      if(itemName == "Speed Boost")
      {
         this["stadiumEnemy" + user].xspeed *= 1.8;
         this["stadiumEnemy" + user].fastDur = 3;
      }
      if(itemName == "Energy Drain")
      {
         _loc6_ = 1;
         while(_loc6_ <= 4)
         {
            if(_loc6_ != user)
            {
               this["stadiumEnemy" + _loc6_].energy -= 10;
               if(this["stadiumEnemy" + _loc6_].energy < 0)
               {
                  this["stadiumEnemy" + _loc6_].energy = 0;
               }
            }
            _loc6_ = _loc6_ + 1;
         }
         stadiumHero.energy -= 10;
         if(stadiumHero.energy < 0)
         {
            stadiumHero.energy = 0;
         }
         this["stadiumEnemy" + user].energy += 40;
      }
      if(itemName == "Slow")
      {
         _loc6_ = 1;
         while(_loc6_ <= 4)
         {
            if(_loc6_ != user)
            {
               this["stadiumEnemy" + _loc6_].slowDur = 4;
            }
            _loc6_ = _loc6_ + 1;
         }
         stadiumHero.slowDur = 4;
      }
      if(itemName == "Stun")
      {
         _loc6_ = 1;
         while(_loc6_ <= 4)
         {
            if(_loc6_ != user)
            {
               this["stadiumEnemy" + _loc6_].stunDur = 2;
            }
            _loc6_ = _loc6_ + 1;
         }
         stadiumHero.stunDur = 2;
      }
      if(itemName == "Darkness")
      {
         _loc6_ = 1;
         while(_loc6_ <= 4)
         {
            if(_loc6_ != user)
            {
               this["stadiumEnemy" + _loc6_].darkDur = 5;
            }
            _loc6_ = _loc6_ + 1;
         }
         stadiumHero.darkDur = 5;
      }
      if(itemName != "")
      {
         _parent.breakStadium(this["stadiumEnemy" + user].mehName + " used " + itemName + "!");
         _root.dispNews(100,this["stadiumEnemy" + user].mehName + " used " + itemName + "!");
      }
      this["stadiumEnemy" + user].curItem = "";
   }
}
function checkLow()
{
   _root.lowPlayer = -1;
   if(Math.random() > stadiumHero.health / 20 && stadiumHero.health > 0)
   {
      _root.lowPlayer = 0;
   }
   else
   {
      var _loc3_ = 1;
      while(_loc3_ <= 4)
      {
         if(Math.random() > this["stadiumEnemy" + _loc3_].health / 20 && _root.lowPlayer == -1 && this["stadiumEnemy" + _loc3_].health > 0)
         {
            _root.lowPlayer = _loc3_;
         }
         _loc3_ = _loc3_ + 1;
      }
   }
}
_root.summonCount = 0;
_root.antiLag = 0;
checkLow();
onEnterFrame = function()
{
   if(Math.random() < 0.01)
   {
      checkLow();
   }
   if(_root.antiLag > 20)
   {
      _root.antiLag = 0;
   }
};