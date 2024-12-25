//! status=pending
on(dragOver,rollOver){
   if(skillLevel > 0)
   {
      _root.actiondescription = "<b><font color=\'#FFFF00\'>Auto Fight</font></b>\nMP Cost: <font color=\'#FFFF00\'>" + mpCost + "</font>\nPower: <font color=\'#FFFF00\'>" + damagePower + "%</font>\nDelay: <font color=\'#FFFF00\'>" + Math.ceil(skillDelay / _root.attackSpeed) + " frames</font>\n\nAttack monsters automatically. Click here to turn Auto Fight on/off.";
   }
}


on(release){
   if(_root.save.autoFight != true)
   {
      _root.save.autoFight = true;
   }
   else
   {
      _root.save.autoFight = false;
   }
}


on(rollOut,dragOut){
   _root.actiondescription = "";
}


onClipEvent(enterFrame){
   if(_root.save.autoFight == false)
   {
      fr = 2;
   }
   else
   {
      fr = 4;
   }
   if(_root.save.autoFight == true && _parent._parent.enemy.enemyID != 0 && _parent._parent.enemy.lifespan > 0.2)
   {
      if(_root.arenaDelay <= 0 && _root.save.arenaMana >= mpCost && _root.arenaStun <= 0)
      {
         _root.arenaDelay = skillDelay;
         _root.arenaDelay2 = skillDelay / 2 - 1;
         _root.arenaSkillPower = damagePower;
         _root.arenaKnockBack = knockBack;
         _root.save.arenaMana -= mpCost;
      }
   }
}


onClipEvent(load){
   hotkey = 71;
   skillID = 0;
   skillLevel = 1;
   mpCost = 0;
   damagePower = 100 + Math.floor(_root.save.arenaSkill[54] * 5);
   if(_root.save.permaBanPenalty[15] == 3)
   {
      damagePower += 200;
   }
   else if(_root.save.permaBanPenalty[15] == 2)
   {
      damagePower += 120;
   }
   else if(_root.save.permaBanPenalty[15] == 1)
   {
      damagePower += 80;
   }
   if(_root.save.arenaSkill[7] >= 1)
   {
      damagePower += 100;
   }
   knockBack = 0;
   skillDelay = 175;
   if(_root.save.arenaSkill[6] >= 1)
   {
      skillDelay = 150;
   }
}

