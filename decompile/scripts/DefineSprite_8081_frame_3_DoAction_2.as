//! status=pending
stop();
shopMoveSpeed = 0;
totalLoc = 0;
if(isNaN(targetMove))
{
   targetMove = -9999;
}
onEnterFrame = function()
{
   if(_root.save.featureIdleMode == true)
   {
      if(Key.isDown(37) || Key.isDown(65))
      {
         shopMoveSpeed += 2;
      }
      if(Key.isDown(39) || Key.isDown(68))
      {
         shopMoveSpeed -= 2;
      }
   }
   shopMoveSpeed *= 0.9;
   if(totalLoc > targetMove * -1 + 10)
   {
      shopMoveSpeed = -50;
   }
   else if(targetMove > 0)
   {
      shopMoveSpeed = 0;
      targetMove = -9999;
   }
};
