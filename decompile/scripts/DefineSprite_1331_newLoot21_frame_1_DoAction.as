//! status=pending
function getLoot()
{
   if(_root.save.questType == "Loot")
   {
      if(_root.save.questSubtype == "Any" || _root.save.questSubtype == "Tukkonium")
      {
         _root.save.questCount += 1;
      }
   }
   amntToGain = lootValue;
   if(isNaN(amntToGain))
   {
      amntToGain = 1;
   }
   _root.gainCareerEXP(4,5000 * amntToGain,true);
   _root.save.arenaTukkonium += amntToGain;
   _root.dispNews(185,"Found " + amntToGain + " [Tukkonium]!");
   _root.house.arena.showDamage("Tukkonium +" + _root.withComma(amntToGain),16777215,_X,_Y - 20);
}
leftChance = 0;
magneticChance = 1;
_X = x;
_Y = y - 50;
xVel = Math.random() * 2;
if(Math.random() < leftChance)
{
   xVel = (- Math.random()) * 2;
}
magnetic = false;
if(_root.lootMagnet == true && Math.random() < magneticChance)
{
   magnetic = true;
}
if(_root.save.bouncyLoot == false)
{
   if(magnetic == true)
   {
      _X = 80;
   }
   else if(_root.save.activityLoot == true && (_root.cursoridle < 5 || _root.arenaBot > 0 && _root.arenaBot < 2400))
   {
      _X = 80;
   }
   else if(x > 85)
   {
      _X = x + xVel * 100;
   }
   else
   {
      _X = x;
   }
   _Y = y;
}
yVel = -5;
xalpha = 250;
del = 0;
onEnterFrame = function()
{
   del += 1;
   if(del >= 2)
   {
      del = 0;
      if(_Y > 0)
      {
         xVel *= 0.98;
         if(_root.save.activityLoot == true && (_root.cursoridle < 5 || _root.arenaBot > 0 && _root.arenaBot < 2400))
         {
            xVel -= 1;
            if(_root.save.bouncyLoot == false)
            {
               _X = 80;
            }
         }
      }
      yVel += 1;
      if(_Y > 150 && yVel > 0)
      {
         yVel *= -0.6;
      }
      if(_root.save.bouncyLoot != false)
      {
         if(magnetic == true)
         {
            xVel -= 1;
         }
         if(_Y > 0)
         {
            _X = _X + xVel;
         }
         _Y = _Y + yVel;
      }
      if(_X > 500)
      {
         _X = 500;
      }
      if(xalpha > 0)
      {
         xalpha -= 100 / _root.fps;
         if(_X < 85 || _xmouse >= -25 && _xmouse <= 25 && _ymouse >= -50 && _ymouse <= 5 && _root.cursoridle < 60)
         {
            _root.save.arenaLoot += 1;
            getLoot();
            onEnterFrame = null;
            unloadMovie(this);
            this.removeMovieClip();
         }
      }
      else
      {
         onEnterFrame = null;
         unloadMovie(this);
         this.removeMovieClip();
      }
      if(_root._quality == "HIGH" || _root._quality == "BEST")
      {
         _alpha = xalpha;
      }
   }
};