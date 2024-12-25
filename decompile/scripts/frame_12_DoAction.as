//! status=pending
function addSaveVar(varName, varValue)
{
   if(_root.save[varName] == undefined || isNaN(_root.save[varName]) && !isNaN(varValue) && _root.saveid != -1)
   {
      _root.save[varName] = varValue;
   }
}
function addNewsType(typeID, feature, defaultImportance, defaultColor, sauceName)
{
   _root.newsCount += 1;
   _root.newsID[_root.newsCount] = typeID;
   _root.newsFeature[typeID] = feature;
   _root.newsSauceName[_root.newsCount] = sauceName;
   if(typeID != 0 && isNaN(_root.saveGlobal.breakR[typeID]))
   {
      if(defaultImportance == 4)
      {
         _root.saveGlobal.breakTab1[typeID] = true;
         _root.saveGlobal.breakTab2[typeID] = true;
         _root.saveGlobal.breakTab3[typeID] = true;
         _root.saveGlobal.breakTab4[typeID] = true;
         _root.saveGlobal.breakAll[typeID] = true;
         _root.saveGlobal.breakFeature[typeID] = true;
      }
      else if(defaultImportance == 3)
      {
         _root.saveGlobal.breakTab1[typeID] = true;
         _root.saveGlobal.breakTab2[typeID] = true;
         _root.saveGlobal.breakTab3[typeID] = true;
         _root.saveGlobal.breakTab4[typeID] = false;
         _root.saveGlobal.breakAll[typeID] = false;
         _root.saveGlobal.breakFeature[typeID] = true;
      }
      else if(defaultImportance == 2)
      {
         _root.saveGlobal.breakTab1[typeID] = true;
         _root.saveGlobal.breakTab2[typeID] = true;
         _root.saveGlobal.breakTab3[typeID] = false;
         _root.saveGlobal.breakTab4[typeID] = false;
         _root.saveGlobal.breakAll[typeID] = false;
         _root.saveGlobal.breakFeature[typeID] = true;
      }
      else if(defaultImportance == 1)
      {
         _root.saveGlobal.breakTab1[typeID] = true;
         _root.saveGlobal.breakTab2[typeID] = false;
         _root.saveGlobal.breakTab3[typeID] = false;
         _root.saveGlobal.breakTab4[typeID] = false;
         _root.saveGlobal.breakAll[typeID] = false;
         _root.saveGlobal.breakFeature[typeID] = false;
      }
      else
      {
         _root.saveGlobal.breakTab1[typeID] = false;
         _root.saveGlobal.breakTab2[typeID] = false;
         _root.saveGlobal.breakTab3[typeID] = false;
         _root.saveGlobal.breakTab4[typeID] = false;
         _root.saveGlobal.breakAll[typeID] = false;
         _root.saveGlobal.breakFeature[typeID] = false;
      }
      if(feature == 0)
      {
         _root.saveGlobal.breakFeature[typeID] = false;
      }
      _root.saveGlobal.breakR[typeID] = Math.floor(defaultColor / 65536);
      _root.saveGlobal.breakG[typeID] = Math.floor((defaultColor - _root.saveGlobal.breakR[typeID] * 65536) / 256);
      _root.saveGlobal.breakB[typeID] = Math.floor(defaultColor - _root.saveGlobal.breakR[typeID] * 65536 - _root.saveGlobal.breakG[typeID] * 256);
   }
}
_root.autoBanned = 0;
_root.systemclock = new Date();
_root.systemtimenow = _root.systemclock.getTime();
var globalSetting = SharedObject.getLocal("ATG_Global","/");
var my_so = SharedObject.getLocal("antiIdle_file0","/");
var another_so = SharedObject.getLocal("antiIdle_temp","/");
if(isNaN(_root.saveid))
{
   _root.saveid = -1;
}
if(_root.saveid == 0)
{
   var my_so = SharedObject.getLocal("antiIdle_file0","/");
}
if(_root.saveid == 1)
{
   var my_so = SharedObject.getLocal("antiIdle_file1","/");
}
if(_root.saveid == 2)
{
   var my_so = SharedObject.getLocal("antiIdle_file2","/");
}
if(_root.saveid == 3)
{
   var my_so = SharedObject.getLocal("antiIdle_file3","/");
}
if(_root.saveid == 4)
{
   var my_so = SharedObject.getLocal("antiIdle_file4","/");
}
if(_root.saveid == 10)
{
   var my_so = SharedObject.getLocal("antiIdle_file10","/");
}
if(_root.saveid == 11)
{
   var my_so = SharedObject.getLocal("antiIdle_file11","/");
}
if(_root.saveid == 12)
{
   var my_so = SharedObject.getLocal("antiIdle_file12","/");
}
if(_root.saveid == 13)
{
   var my_so = SharedObject.getLocal("antiIdle_file13","/");
}
if(_root.saveid >= 20)
{
   var my_so = SharedObject.getLocal("antiIdle_file" + _root.saveid,"/");
}
if(_root.craftTool == true)
{
   var my_so = SharedObject.getLocal("v1861_craftSim","/");
}
var save = _root.my_so.data;
var saveGlobal = _root.globalSetting.data;
if(_root.saveGlobal.graphicQuality == undefined)
{
   _root.saveGlobal.graphicQuality = "HIGH";
   _root.saveGlobal.keyboardLayout = "qwerty";
}
if(_root.saveGlobal.showTitle == undefined)
{
   _root.saveGlobal.showTitle = true;
}
if(_root.saveGlobal.aurianMode == undefined)
{
   _root.saveGlobal.aurianMode = false;
}
if(isNaN(_root.saveGlobal.latestVersion))
{
   _root.saveGlobal.latestVersion = 1380;
}
if(_root.saveGlobal.speedrunUnlock0 == undefined)
{
   _root.saveGlobal.speedrunUnlock0 = false;
   _root.saveGlobal.speedrunUnlock1 = false;
   _root.saveGlobal.speedrunUnlock2 = false;
   _root.saveGlobal.speedrunUnlock3 = false;
}
if(_root.saveGlobal.challengePerfect == undefined)
{
   _root.saveGlobal.challengeTime = new Array();
   _root.saveGlobal.challengeAttempted = new Array();
   _root.saveGlobal.challengePerfect = new Array();
}
if(_root.saveGlobal.breakTab1 == undefined)
{
   _root.saveGlobal.breakTab1 = new Array();
   _root.saveGlobal.breakTab2 = new Array();
   _root.saveGlobal.breakTab3 = new Array();
   _root.saveGlobal.breakTab4 = new Array();
   _root.saveGlobal.breakAll = new Array();
   _root.saveGlobal.breakFeature = new Array();
   _root.saveGlobal.breakR = new Array();
   _root.saveGlobal.breakG = new Array();
   _root.saveGlobal.breakB = new Array();
}
if(_root.saveGlobal.adminMode == undefined)
{
   _root.saveGlobal.adminMode = "";
}
if(_root.saveGlobal.defTab == undefined)
{
   _root.saveGlobal.defTab = 2;
}
if(_root.saveGlobal.selectedSave == undefined)
{
   _root.saveGlobal.selectedSave = 0;
   _root.saveGlobal.playTime = ["?","?","?","?"];
   _root.saveGlobal.curLevel = ["","","",""];
   _root.saveGlobal.ascCount = ["","","",""];
}
if(_root.saveGlobal.skipMenu == undefined)
{
   _root.saveGlobal.skipMenu = false;
}
if(_root.saveGlobal.keyArenaZ == undefined)
{
   _root.saveGlobal.keyArenaZ = 90;
   _root.saveGlobal.keyArenaX = 88;
   _root.saveGlobal.keyArenaC = 67;
   _root.saveGlobal.keyArenaV = 86;
   _root.saveGlobal.keyArenaB = 66;
   _root.saveGlobal.keyArenaA = 65;
   _root.saveGlobal.keyArenaS = 83;
   _root.saveGlobal.keyArenaD = 68;
   _root.saveGlobal.keyArenaF = 70;
   _root.saveGlobal.keyArenaQ = 81;
   _root.saveGlobal.keyArenaW = 87;
   _root.saveGlobal.keyPongUp1 = 38;
   _root.saveGlobal.keyPongUp2 = 87;
   _root.saveGlobal.keyPongDown1 = 40;
   _root.saveGlobal.keyPongDown2 = 83;
   _root.saveGlobal.keyMmrLeft1 = 37;
   _root.saveGlobal.keyMmrLeft2 = 65;
   _root.saveGlobal.keyMmrDown1 = 40;
   _root.saveGlobal.keyMmrDown2 = 83;
   _root.saveGlobal.keyMmrRight1 = 39;
   _root.saveGlobal.keyMmrRight2 = 68;
   _root.saveGlobal.keyBalLeft1 = 37;
   _root.saveGlobal.keyBalLeft2 = 65;
   _root.saveGlobal.keyBalDown1 = 40;
   _root.saveGlobal.keyBalDown2 = 83;
   _root.saveGlobal.keyBalRight1 = 39;
   _root.saveGlobal.keyBalRight2 = 68;
}
if(_root.saveid <= 3)
{
   if(_root.save.dbExp > 100 || _root.save.dbCoin > 100 || _root.save.dbGreenCoin > 100 || _root.save.dbBlueCoin > 100)
   {
      if(_root.save.safeHacking == false && _root.save.submitScore == true)
      {
         _root.my_so.clear();
         _root.gotoAndStop(1);
      }
   }
}
if(_root.saveid < 10 || _root.saveid >= 20)
{
   addSaveVar("lockedFile",false);
}
else
{
   addSaveVar("lockedFile",true);
}
addSaveVar("pleaseRead","If you wish to hack, please turn Safe Hacking Mode on by changing the safeHacking variable to true (ticking the box in .sol Editor).");
addSaveVar("safeHacking",false);
if(_root.saveid < 20)
{
   addSaveVar("submitScore",false);
   addSaveVar("submitScoreConfirm",false);
}
else
{
   addSaveVar("submitScore",false);
   addSaveVar("submitScoreConfirm",true);
}
addSaveVar("refundReceived",false);
addSaveVar("refundCooldown",0);
addSaveVar("refundTier",0);
addSaveVar("refundCode",0);
addSaveVar("noobMode",false);
addSaveVar("noobMode2",false);
addSaveVar("cheatEnabled",false);
addSaveVar("offlineProgress",false);
addSaveVar("offlineProgressFirst",false);
addSaveVar("offlineProgressPromo",false);
addSaveVar("gOldAscension",false);
addSaveVar("gDifficulty",1);
addSaveVar("newbieSupport",0);
addSaveVar("bankCoin",0);
addSaveVar("bankGreenCoin",0);
addSaveVar("bankBlueCoin",0);
addSaveVar("bankGardenFruit",0);
addSaveVar("bankGardenPoint",0);
addSaveVar("bankArenaPixel",0);
addSaveVar("bankArenaCraft",0);
addSaveVar("dbExp",100);
addSaveVar("dbCoin",100);
addSaveVar("dbGreenCoin",100);
addSaveVar("dbBlueCoin",100);
addSaveVar("todayCode",0);
addSaveVar("consecutiveDays",1);
addSaveVar("maxConsecutiveDays",1);
addSaveVar("dailyPending",false);
addSaveVar("restTime",0);
addSaveVar("restEfficiency",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("doubleExpTime",0);
addSaveVar("doubleCoinTime",0);
addSaveVar("rewardBotTime",0);
addSaveVar("autoHarvestTime",0);
addSaveVar("eliteButtonTime",0);
addSaveVar("batteryChargerTime",0);
addSaveVar("stadiumProTime",0);
addSaveVar("powerUserTime",0);
addSaveVar("demandMasterTime",0);
addSaveVar("quickAdventuresTime",0);
addSaveVar("eliteFisherTime",0);
addSaveVar("noAntsTime",0);
addSaveVar("doubleQuestTime",0);
addSaveVar("totalPlays",0);
addSaveVar("firstPlayed",_root.systemtimenow);
addSaveVar("lastPlayed",_root.systemtimenow);
addSaveVar("totalPlayTime",0);
addSaveVar("ascendPlayTime",0);
addSaveVar("longestSession",0);
addSaveVar("longestQuit",0);
addSaveVar("mainStatPage",1);
addSaveVar("challengeAttempted",[false]);
addSaveVar("challengeClear",[false]);
addSaveVar("challengePerfect",[false]);
addSaveVar("expGraph",[0,0,0,0,0,0,0,0]);
addSaveVar("expGraph2",[0,0,0,0,0,0,0,0]);
addSaveVar("coinGraph",[0,0,0,0,0,0,0,0]);
addSaveVar("coinGraph2",[0,0,0,0,0,0,0,0]);
addSaveVar("greenCoinGraph",[0,0,0,0,0,0,0,0]);
addSaveVar("greenCoinGraph2",[0,0,0,0,0,0,0,0]);
addSaveVar("blueCoinGraph",[0,0,0,0,0,0,0,0]);
addSaveVar("blueCoinGraph2",[0,0,0,0,0,0,0,0]);
addSaveVar("whiteCoinGraph",[0,0,0,0,0,0,0,0]);
addSaveVar("whiteCoinGraph2",[0,0,0,0,0,0,0,0]);
addSaveVar("graphDisplay","exp");
addSaveVar("graphName","EXP");
addSaveVar("graphType",1);
addSaveVar("sauceType",1);
addSaveVar("totalType",1);
addSaveVar("syncChart",1);
addSaveVar("expSauce",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
if(_root.save.expSauce[41] == undefined)
{
   _root.save.expSauce[41] = 0;
}
addSaveVar("coinSauce",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
if(_root.save.coinSauce[41] == undefined)
{
   _root.save.coinSauce[41] = 0;
}
addSaveVar("expSauceAsc",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
if(_root.save.expSauceAsc[41] == undefined)
{
   _root.save.expSauceAsc[41] = 0;
}
addSaveVar("greenCoinSauce",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("blueCoinSauce",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("whiteCoinSauce",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("expTotal",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("coinTotal",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("greenCoinTotal",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("blueCoinTotal",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("whiteCoinTotal",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("viewStat",0);
addSaveVar("viewAchievement",0);
addSaveVar("viewEvent",0);
addSaveVar("viewQuest",0);
addSaveVar("viewOption",0);
addSaveVar("manualSave",0);
addSaveVar("totalMute",0);
addSaveVar("newbieProgress",0);
addSaveVar("maxAchievement",0);
addSaveVar("trackachnum",0);
addSaveVar("userTitle","Welcome to Anti-Idle!");
addSaveVar("achEarnTime",new Array());
addSaveVar("mainQuestRank",new Array());
addSaveVar("mainQuestC",0);
addSaveVar("mainQuestB",0);
addSaveVar("mainQuestA",0);
addSaveVar("mainQuestS",0);
addSaveVar("mainQuestCount",0);
addSaveVar("questDifficulty",5);
addSaveVar("questFeature","Main");
addSaveVar("questType","Level Up");
addSaveVar("questSubtype","Any");
addSaveVar("questNeed",100);
addSaveVar("questCurrent",1);
addSaveVar("questReward","Legendary Box");
addSaveVar("questRewardQuan",1);
addSaveVar("questRewardBlueCoin",1000);
addSaveVar("questRewardToken",1000);
addSaveVar("questBot",0);
addSaveVar("questCount",0);
addSaveVar("questRecord",0);
addSaveVar("questTotal",0);
addSaveVar("questToday",0);
addSaveVar("questSkipToday",0);
addSaveVar("questInstaToday",0);
addSaveVar("questStreak",0);
addSaveVar("questDescA","Reach level");
addSaveVar("questDescB","to unlock other quests. An alternative way is to forfeit this quest.");
addSaveVar("questTargetDiff",15);
addSaveVar("shinyToken",0);
addSaveVar("questToken",0);
addSaveVar("eventToken",0);
addSaveVar("eventTokenToday",0);
addSaveVar("hyperDay",[0,0,0]);
addSaveVar("hyperDayDel",2);
addSaveVar("hyperDayRem",3);
addSaveVar("hyperDayCount",0);
addSaveVar("regretRem",1);
addSaveVar("arenaSampleCraft",3);
addSaveVar("specialShopVisit",0);
addSaveVar("featureSpecialShop",false);
addSaveVar("specialStock",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("bestLevel",1);
addSaveVar("level",1);
addSaveVar("cursornum",1);
addSaveVar("bgNum",8);
addSaveVar("currentExp",0);
addSaveVar("totalExp",0);
addSaveVar("bestExp",0);
addSaveVar("expLag",0);
addSaveVar("coinLag",0);
addSaveVar("expFrame",0);
addSaveVar("coinFrame",0);
addSaveVar("greenCoinFrame",0);
addSaveVar("blueCoinFrame",0);
addSaveVar("dt",0);
addSaveVar("coin",10000);
addSaveVar("greenCoin",0);
addSaveVar("blueCoin",0);
addSaveVar("whiteCoin",0);
addSaveVar("whiteCoinRefund",0);
addSaveVar("whiteCoinRefundTotal",0);
addSaveVar("coinMax",10000);
addSaveVar("greenCoinMax",0);
addSaveVar("blueCoinMax",0);
addSaveVar("whiteCoinMax",0);
addSaveVar("coinOvercap",0);
addSaveVar("greenCoinOvercap",0);
addSaveVar("blueCoinOvercap",0);
addSaveVar("reforgingCoin",0);
addSaveVar("reforgingGreenCoin",0);
addSaveVar("reforgingBlueCoin",0);
addSaveVar("reforgingOrb1",0);
addSaveVar("reforgingOrb2",0);
addSaveVar("reforgingOrb3",0);
addSaveVar("reforgingOrbTotal1",0);
addSaveVar("reforgingOrbTotal2",0);
addSaveVar("reforgingOrbTotal3",0);
addSaveVar("autoAscendEnabled1",0);
addSaveVar("autoAscendEnabled2",0);
addSaveVar("autoAscendEnabled3",0);
addSaveVar("autoAscendCount1",0);
addSaveVar("autoAscendCount2",0);
addSaveVar("autoAscendCount3",0);
addSaveVar("autoAp",0);
addSaveVar("reforgeMode",1);
addSaveVar("redCoinSpent",0);
addSaveVar("wcDropToday",0);
addSaveVar("progFrag",0);
addSaveVar("rewardClaim",0);
addSaveVar("rewardClaimAuto",0);
addSaveVar("rewardClaimManual",0);
addSaveVar("progFirstRestock",false);
addSaveVar("progTutorial",false);
addSaveVar("restTutorial",false);
addSaveVar("progSpeedAuto",30);
addSaveVar("progSpeedManual",100);
addSaveVar("progModuleName",["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]);
addSaveVar("progModuleTier",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("progModuleSize",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("progModuleShiny",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("progModuleType",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("progModuleChance",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("progModuleEffect",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("progModuleCost",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("progModuleScroll",0);
addSaveVar("progModuleSlot",30);
addSaveVar("progStore",100);
addSaveVar("megaBoostPotion",0);
addSaveVar("boostPotion",0);
addSaveVar("boostFreeze",0);
addSaveVar("boost",100);
addSaveVar("boostProg",100);
addSaveVar("boostExp",100);
addSaveVar("boostCoin",100);
addSaveVar("boostMax",500);
addSaveVar("boostMin",100);
addSaveVar("boostPremium",0);
addSaveVar("boostZebra",0);
addSaveVar("boostTemp",0);
addSaveVar("boostPurchased",0);
addSaveVar("ants",100);
addSaveVar("speedRun9001",2147483647);
addSaveVar("speedRun9002",2147483647);
addSaveVar("speedRunAscend",2147483647);
addSaveVar("speedRunAscendHard",2147483647);
addSaveVar("speedRunAscendImpossible",2147483647);
addSaveVar("count9002",0);
addSaveVar("speedRunMode1000",2147483647);
addSaveVar("speedRunMode2000",2147483647);
addSaveVar("speedRunMode3000",2147483647);
addSaveVar("speedRunMode4000",2147483647);
addSaveVar("speedRunMode5000",2147483647);
addSaveVar("speedRunMode6000",2147483647);
addSaveVar("speedRunMode7000",2147483647);
addSaveVar("speedRunMode8000",2147483647);
addSaveVar("speedRunMode9000",2147483647);
addSaveVar("speedRunMode9001",2147483647);
addSaveVar("speedRunClear",0);
addSaveVar("speedRunScore",0);
addSaveVar("speedRunCoin",0);
addSaveVar("speedRunTotalCoin",0);
addSaveVar("speedRunNextDay",1440);
addSaveVar("petExist",0);
addSaveVar("petName","");
addSaveVar("petBestLevel",0);
addSaveVar("petFullness",0);
addSaveVar("petHealth",0);
addSaveVar("petMana",0);
addSaveVar("petStat",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("petFullnessRestore",1);
addSaveVar("petHealthRestore",1);
addSaveVar("deadPetName","");
addSaveVar("deadPetStat",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("botLevel",1);
addSaveVar("botExp",0);
addSaveVar("botEnergy",14400);
addSaveVar("botPoint",1000);
addSaveVar("botOp",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("botTrain",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("botActive",false);
addSaveVar("botCurrentOp",0);
addSaveVar("botCurrentOpNum",0);
addSaveVar("botCurrentOpMax",0);
addSaveVar("botCurrentOpTime",0);
addSaveVar("botPill",0);
addSaveVar("botPillCrafted",0);
addSaveVar("botPillUsed",0);
addSaveVar("botMaxTask",0);
addSaveVar("banned",0);
addSaveVar("bannedHard",0);
addSaveVar("bannedImpossible",0);
addSaveVar("banned1662",0);
addSaveVar("bannedB",0);
addSaveVar("idleMode",false);
addSaveVar("boostAuto",false);
addSaveVar("boostAuto2",false);
addSaveVar("boostAutoPct",100);
addSaveVar("boostAutoCondition",4);
addSaveVar("boostAutoMax",150);
addSaveVar("boostAutoToday",0);
addSaveVar("newHouseStick",0);
addSaveVar("newHouseHead",0);
addSaveVar("newHouseEyes",0);
addSaveVar("newHouseMouth",0);
addSaveVar("newHouseHat",0);
addSaveVar("newHouseGlasses",0);
addSaveVar("newHouseShirt",0);
addSaveVar("newHouseLeftHand",0);
addSaveVar("newHouseRightHand",0);
addSaveVar("newHousePants",0);
addSaveVar("newHouseShoes",0);
addSaveVar("newHouseFloor",0);
addSaveVar("newHouseWall",0);
addSaveVar("newHouseWindow",0);
addSaveVar("newHouseWallObject",0);
addSaveVar("newHouseDesk",0);
addSaveVar("newHouseDeskObject",0);
addSaveVar("newHouseBackObject",0);
addSaveVar("newHouseFrontObject",0);
addSaveVar("newHousePet",0);
addSaveVar("newHouseCover",0);
addSaveVar("newHouseUStick",[1]);
addSaveVar("newHouseUHead",[1]);
addSaveVar("newHouseUEyes",[1]);
addSaveVar("newHouseUMouth",[1]);
addSaveVar("newHouseUHat",[1]);
addSaveVar("newHouseUGlasses",[1]);
addSaveVar("newHouseUShirt",[1]);
addSaveVar("newHouseULeftHand",[1]);
addSaveVar("newHouseURightHand",[1]);
addSaveVar("newHouseUPants",[1]);
addSaveVar("newHouseUShoes",[1]);
addSaveVar("newHouseUFloor",[1]);
addSaveVar("newHouseUWall",[1]);
addSaveVar("newHouseUWindow",[1]);
addSaveVar("newHouseUWallObject",[1]);
addSaveVar("newHouseUDesk",[1]);
addSaveVar("newHouseUDeskObject",[1]);
addSaveVar("newHouseUBackObject",[1]);
addSaveVar("newHouseUFrontObject",[1]);
addSaveVar("newHouseUPet",[1]);
addSaveVar("newHouseUCover",[1]);
addSaveVar("newHouseXWindow",220);
addSaveVar("newHouseXWallObject",400);
addSaveVar("newHouseXDesk",180);
addSaveVar("newHouseXBackObject",195);
addSaveVar("newHouseXFrontObject",0);
addSaveVar("newHouseXPet",350);
addSaveVar("newHouseXStickman",80);
addSaveVar("newHouseFloor",2);
addSaveVar("blackHoleCoin",0);
addSaveVar("blackHoleGreenCoin",0);
addSaveVar("blackHoleBlueCoin",0);
addSaveVar("blackHoleWhiteCoin",0);
addSaveVar("blackHoleCoinRem",0);
addSaveVar("blackHoleGreenCoinRem",0);
addSaveVar("blackHoleBlueCoinRem",0);
addSaveVar("houseRoom1",false);
addSaveVar("houseRoom2",false);
addSaveVar("houseRoom3",false);
addSaveVar("houseWood",0);
addSaveVar("houseBrick",0);
addSaveVar("houseNail",0);
addSaveVar("housePaint",0);
addSaveVar("houseMagicRock",0);
addSaveVar("houseWhiteCoin",0);
addSaveVar("houseWhiteCoinMax",0);
addSaveVar("houseActivityCrystal",0);
addSaveVar("houseActivityCrystalToday",0);
addSaveVar("houseActivityCrystalMax",0);
addSaveVar("houseAchievementCrystal",0);
addSaveVar("houseQuestCrystal",0);
addSaveVar("houseAscensionCrystal",0);
addSaveVar("houseFloorUnlocked",[0,1]);
addSaveVar("houseWallUnlocked",[0,1]);
addSaveVar("houseObjectUnlocked",[0,1]);
addSaveVar("houseSkinUnlocked",[0,1]);
addSaveVar("houseBorderUnlocked",[0,1]);
addSaveVar("houseHatUnlocked",[0,1]);
addSaveVar("houseLeftEyeUnlocked",[0,1]);
addSaveVar("houseRightEyeUnlocked",[0,1]);
addSaveVar("houseGlassesUnlocked",[0,1]);
addSaveVar("houseMouthUnlocked",[0,1]);
addSaveVar("houseShirtUnlocked",[0,1]);
addSaveVar("houseLeftHandUnlocked",[0,1]);
addSaveVar("houseRightHandUnlocked",[0,1]);
addSaveVar("housePantsUnlocked",[0,1]);
addSaveVar("houseLeftFootUnlocked",[0,1]);
addSaveVar("houseRightFootUnlocked",[0,1]);
addSaveVar("houseVer",0);
addSaveVar("houseFloor",1);
addSaveVar("houseWall",1);
addSaveVar("houseObject",1);
addSaveVar("houseSkin",1);
addSaveVar("houseBorder",1);
addSaveVar("houseHat",1);
addSaveVar("houseLeftEye",1);
addSaveVar("houseRightEye",1);
addSaveVar("houseGlasses",1);
addSaveVar("houseMouth",1);
addSaveVar("houseShirt",1);
addSaveVar("houseLeftHand",1);
addSaveVar("houseRightHand",1);
addSaveVar("housePants",1);
addSaveVar("houseLeftFoot",1);
addSaveVar("houseRightFoot",1);
addSaveVar("houseX1",100);
addSaveVar("houseY1",60);
addSaveVar("houseX2",180);
addSaveVar("houseY2",280);
addSaveVar("houseX3",230);
addSaveVar("houseY3",250);
addSaveVar("houseBestThrow1",0);
addSaveVar("houseBestThrow2",0);
addSaveVar("houseFurniture1",false);
addSaveVar("houseFurniture2",false);
addSaveVar("houseFurniture3",false);
addSaveVar("houseFurniture4",false);
addSaveVar("houseFurniture5",false);
addSaveVar("houseFurniture6",false);
addSaveVar("houseFurniture7",false);
addSaveVar("houseFurniture8",false);
addSaveVar("houseFurniture9",false);
addSaveVar("houseFurniture10",false);
addSaveVar("houseFurniture11",false);
addSaveVar("featureIdleMode",false);
addSaveVar("featureBoostGen",false);
addSaveVar("featureBoostAuto",false);
addSaveVar("featureGarden",false);
addSaveVar("featureBattleArena",false);
addSaveVar("featureButtonMachine",false);
addSaveVar("featureMoneyPrinter",false);
addSaveVar("featureMysteryShop",false);
addSaveVar("featureArcade",false);
addSaveVar("featureStadium",false);
addSaveVar("featureAutoSprayer",false);
addSaveVar("featureEpicLicense",false);
addSaveVar("featureTukkunFCG",false);
addSaveVar("featureLolMarket",false);
addSaveVar("featureAwesomeAdventures",false);
addSaveVar("featureFishing",false);
addSaveVar("featureSeppuku",false);
addSaveVar("featureInstantWin",false);
addSaveVar("featureTechnicalLight",false);
addSaveVar("featureMiniGarden",false);
addSaveVar("featureBestiary",false);
addSaveVar("featureTravelingTicket",false);
addSaveVar("featureSuperBattery",false);
addSaveVar("featureArcadePack",false);
addSaveVar("featureManualSprayer",false);
addSaveVar("featureSpecialSprayer",false);
addSaveVar("featureDoomSprayer",false);
addSaveVar("featureEnergyToolbar",false);
addSaveVar("featureCardToolbar",false);
addSaveVar("featurePetFeedBar",false);
addSaveVar("featurePremiumSprayer",false);
addSaveVar("featureTitleEditor",false);
addSaveVar("featureSecretShop",false);
addSaveVar("featureNewHouse",false);
addSaveVar("featureFactory",false);
addSaveVar("serviceOfflineGrind",false);
addSaveVar("serviceRewardBot",false);
addSaveVar("serviceAutoHarvest",false);
addSaveVar("serviceEliteButton",false);
addSaveVar("serviceBatteryCharger",false);
addSaveVar("serviceStadiumPro",false);
addSaveVar("serviceFCGPowerUser",false);
addSaveVar("serviceDemandMaster",false);
addSaveVar("serviceQuickAdventures",false);
addSaveVar("serviceDoubleQuest",false);
addSaveVar("serviceNoAnts",false);
addSaveVar("bgred",30);
addSaveVar("bggreen",25);
addSaveVar("bgblue",20);
addSaveVar("titlered",255);
addSaveVar("titlegreen",255);
addSaveVar("titleblue",255);
addSaveVar("ripoffCard",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("aprilFoolsBest",0);
addSaveVar("progBoxCount",0);
addSaveVar("progBoxToday",0);
addSaveVar("legendaryBoxOpened",0);
addSaveVar("supplyCrateOpened",0);
addSaveVar("explosionCrateOpened",0);
addSaveVar("awesomeCrateOpened",0);
addSaveVar("chaosCrateOpened",0);
addSaveVar("apocalypseCrateOpened",0);
addSaveVar("pixelatedMysteryBoxOpened",0);
addSaveVar("mysteryBox",[0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("mysteryBoxCollect1",new Array());
addSaveVar("mysteryBoxCollect2",new Array());
addSaveVar("mysteryBoxCollect3",new Array());
addSaveVar("mysteryBoxCollect4",new Array());
addSaveVar("mysteryBoxCollect5",new Array());
addSaveVar("mysteryBoxCollect6",new Array());
addSaveVar("mysteryBoxCollect7",new Array());
addSaveVar("mysteryBoxCollect8",new Array());
addSaveVar("mysteryBoxCollect9",new Array());
addSaveVar("mysteryBoxCollect10",new Array());
addSaveVar("mysteryBoxCollect9001",new Array());
addSaveVar("mysteryBoxBan1",new Array());
addSaveVar("mysteryBoxBan2",new Array());
addSaveVar("mysteryBoxBan3",new Array());
addSaveVar("mysteryBoxBan4",new Array());
addSaveVar("mysteryBoxBan5",new Array());
addSaveVar("mysteryBoxBan6",new Array());
addSaveVar("mysteryBoxBan7",new Array());
addSaveVar("mysteryBoxBan8",new Array());
addSaveVar("mysteryBoxBan9",new Array());
addSaveVar("mysteryBoxBan10",new Array());
addSaveVar("harvestCount",0);
addSaveVar("harvestCoin",0);
addSaveVar("harvestMillion",0);
addSaveVar("gardenFertilizer",5);
addSaveVar("gardenMegaFertilizer",1);
addSaveVar("gardenFertilizerAllow",0);
addSaveVar("gardenPoint",0);
addSaveVar("gardenPointMax",0);
addSaveVar("gardenCapacity",1);
addSaveVar("gardenEXP",0);
addSaveVar("gardenSlotEXP",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("gardenTrees",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("gardenMastery",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("gardenSeed",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("gardenSlotGrade",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("gardenGrade11",0);
addSaveVar("gardenGrade12",0);
addSaveVar("gardenAnotherHarvest",0);
addSaveVar("gardenAnotherMastery",0);
addSaveVar("aagStat1",50);
addSaveVar("aagStat2",50);
addSaveVar("aagStat3",50);
addSaveVar("aagStat4",50);
addSaveVar("gardenBreed0",0);
addSaveVar("gardenBreed1",0);
addSaveVar("gardenBreedReward",0);
addSaveVar("gardenBreedRewardC",0);
addSaveVar("gardenResearch",0);
addSaveVar("gardenBreedTotal",0);
addSaveVar("gardenFruit",0);
addSaveVar("gardenFruitMax",0);
addSaveVar("gardenFullness",0);
addSaveVar("gardenHarvestTime",new Array());
addSaveVar("gardenRecentTime",new Array());
addSaveVar("gardenExpiryTime",new Array());
addSaveVar("gardenPurchaseTime",new Array());
addSaveVar("gardenHarvestValue",new Array());
addSaveVar("gardenTreeExp",new Array());
addSaveVar("gardenTreeFertilize",new Array());
addSaveVar("gardenTreeModuleProc",new Array());
if(isNaN(_root.save.gardenSlotEXP[1]))
{
   _root.save.gardenSlotEXP = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
}
if(isNaN(_root.save.gardenTrees[1]))
{
   _root.save.gardenTrees = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
}
if(isNaN(_root.save.gardenTrees[50]))
{
   i = 26;
   while(i <= 50)
   {
      _root.save.gardenSlotEXP[i] = 0;
      _root.save.gardenTrees[i] = 0;
      i++;
   }
   i = 26;
   while(i <= 100)
   {
      _root.save.gardenMastery[i] = 0;
      i++;
   }
}
addSaveVar("arenaTutorial",0);
addSaveVar("arenaBonusPreference1","None");
addSaveVar("arenaBonusPreference2","None");
addSaveVar("arenaAbilityPreference1","None");
addSaveVar("arenaAbilityPreference2","None");
addSaveVar("arenaAbilityPreference3","None");
addSaveVar("arenaMoreBonusPreference1","None");
addSaveVar("arenaMoreBonusPreference2","None");
addSaveVar("filterPref1t",1);
addSaveVar("filterPref2t",9999);
addSaveVar("filterPref3t",1);
addSaveVar("filterPref4t",9001);
addSaveVar("filterPref5t","Reward");
addSaveVar("filterPref6t","Attack: Regular");
addSaveVar("filterPref7t","Dummy");
addSaveVar("filterPref8t",0);
addSaveVar("filterPref9t",15);
addSaveVar("filterPref1c",false);
addSaveVar("filterPref2c",false);
addSaveVar("filterPref3c",false);
addSaveVar("filterPref4c",false);
addSaveVar("filterPref5c",false);
addSaveVar("filterPref6c",false);
addSaveVar("filterPref7c",false);
addSaveVar("filterPref8c",false);
addSaveVar("filterPref9c",false);
addSaveVar("filterPref10c",false);
addSaveVar("filterPref11c",false);
addSaveVar("filterPref12c",false);
addSaveVar("filterPref13c",false);
addSaveVar("collectionPoint",0);
addSaveVar("collectionPointMax",0);
addSaveVar("collectionPointTrophy",0);
addSaveVar("battlePoint",0);
addSaveVar("battleReward",0);
addSaveVar("battleDaily",false);
addSaveVar("arenaLoot",0);
addSaveVar("arenaPixel",0);
addSaveVar("arenaPixelMax",0);
addSaveVar("arenaCraft",0);
addSaveVar("arenaCraftMax",0);
addSaveVar("arenaMaxDamage",0);
addSaveVar("arenaBacon",0);
addSaveVar("freeBacon1",25);
addSaveVar("freeBacon2",50);
addSaveVar("robaconLevel",1);
addSaveVar("robaconExp",0);
addSaveVar("robaconExpTotal",0);
addSaveVar("robaconSP",0);
addSaveVar("robaconBacon",100);
addSaveVar("vegetarianMode",false);
addSaveVar("arenaBuffDuration",0);
addSaveVar("arenaBuffType",0);
addSaveVar("arenaRuneLevel",[0,1,1,1,1,1,1]);
addSaveVar("arenaRuneAuto",[false,false,false,false,false,false,false]);
addSaveVar("arenaRuneDuration",[0,0,0,0,0,0,0]);
addSaveVar("arenaWeapon",1);
addSaveVar("arenaSubWeapon",0);
addSaveVar("arenaHat",101);
addSaveVar("arenaShirt",102);
addSaveVar("arenaGloves",103);
addSaveVar("arenaPants",104);
addSaveVar("arenaShoes",105);
addSaveVar("arenaMedal",0);
addSaveVar("arenaPendant",0);
addSaveVar("arenaEarring",0);
addSaveVar("arenaTrinket",0);
addSaveVar("arenaSkin",0);
addSaveVar("arenaOutfitHat",0);
addSaveVar("arenaOutfitShirt",0);
addSaveVar("arenaOutfitGloves",0);
addSaveVar("arenaOutfitPants",0);
addSaveVar("arenaOutfitShoes",0);
addSaveVar("arenaOutfitSkin",0);
addSaveVar("arenaOutfitEarring",0);
addSaveVar("arenaOutfitMedal",0);
addSaveVar("arenaOutfitWeapon",0);
addSaveVar("arenaRing",0);
addSaveVar("arenaRingOwned",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("arenaCrystal1",0);
addSaveVar("arenaCrystal2",0);
addSaveVar("roflRing",0);
addSaveVar("roflPendant",0);
addSaveVar("medalColor",3);
addSaveVar("disableDrawing",false);
addSaveVar("disableManaEffect",false);
addSaveVar("visibleRing",true);
addSaveVar("drawingBoardHex",new Array());
addSaveVar("drawingBoardAlp",new Array());
addSaveVar("arenaPotion",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("arenaFilter","Item Name 1,Item Name 2");
addSaveVar("arenaEvent",0);
addSaveVar("arenaEventPoint",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("arenaEventReward",new Array());
addSaveVar("arenaEventKey",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("arenaAuto",0);
addSaveVar("arenaAutoTime",0);
addSaveVar("arenaLevel",1);
addSaveVar("arenaExp",0);
addSaveVar("arenaExpTotal",0);
addSaveVar("arenaExpExcess",0);
addSaveVar("arenaSP",20);
addSaveVar("arenaUltimateSP",0);
addSaveVar("arenaSkill",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("arenaSkillMax",[0,30,30,30,30,10,1,1,1,10,10,20,20,30,30,30,20,0,30,10,30,10,30,30,10,30,1,10,10,20,30,10,30,30,50,50,30,10,30,10,20,10,20,10,20,30,0,0,0,1,30,10,10,30,20,10,10,10,10,10,10,10,10,10,10,10,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
if(isNaN(_root.save.arenaSkill[101]))
{
   _root.save.arenaSkill[101] = 0;
   _root.save.arenaSkill[102] = 0;
   _root.save.arenaSkill[103] = 0;
}
if(isNaN(_root.save.arenaSkill[104]))
{
   _root.save.arenaSkill[104] = 0;
   _root.save.arenaSkill[105] = 0;
   _root.save.arenaSkill[106] = 0;
}
addSaveVar("arenaTotalSkill",0);
addSaveVar("arenaTotalSP",0);
addSaveVar("arenaSkillBook",0);
addSaveVar("arenaHealth",2500);
addSaveVar("arenaMaxHealth",2500);
addSaveVar("arenaMana",1000);
addSaveVar("arenaMaxMana",1000);
addSaveVar("arenaSpirit",0);
addSaveVar("arenaFury",0);
addSaveVar("arenaAttack",100);
addSaveVar("arenaDefense",100);
addSaveVar("arenaAccuracy",100);
addSaveVar("arenaEvasion",100);
addSaveVar("arenaOxygenPenalty",0);
addSaveVar("arenaRage",0);
addSaveVar("arenaManaPower",false);
addSaveVar("arenaMission",0);
addSaveVar("arenaKommanderProgress",0);
addSaveVar("arenaKommanderMonID",2);
addSaveVar("arenaKommanderMonCount",5);
addSaveVar("arenaKommanderProgBox",5);
addSaveVar("arenaKommanderPixBox",5);
addSaveVar("arenaKommanderProof",5);
addSaveVar("arenaKommanderSkip",3);
addSaveVar("arenaMaxEntry",10);
addSaveVar("arenaPyramidEntry",10);
addSaveVar("arenaMegabossEntry",10);
addSaveVar("arenaCorruptionEntry",10);
addSaveVar("arenaRevengeEntry",10);
addSaveVar("arenaEndlessEntry",1);
addSaveVar("arenaBonusChange",100);
addSaveVar("arenaKommanderComplete",0);
addSaveVar("arenaDefendComplete",0);
addSaveVar("arenaPrehistoricComplete",0);
addSaveVar("arenaDefendMega",0);
addSaveVar("arenaPrehistoricMega",0);
addSaveVar("arenaProofTraining",0);
addSaveVar("arenaProofMission",0);
addSaveVar("arenaSuperiorCraft",0);
addSaveVar("arenaUnobtainium",0);
addSaveVar("arenaTukkonium",0);
addSaveVar("arenaKill",0);
addSaveVar("arenaKillWhite",0);
addSaveVar("arenaKillRed",0);
addSaveVar("arenaKillPurple",0);
addSaveVar("arenaKillRare",0);
addSaveVar("arenaKillEpic",0);
addSaveVar("arenaDeath",0);
addSaveVar("arenaMaxEnhance",0);
addSaveVar("arenaFreeReset",0);
addSaveVar("arenaDiscoverAlley",false);
addSaveVar("arenaDiscoverSmiley",false);
addSaveVar("arenaDiscoverPokayman",false);
addSaveVar("pokayCD",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("pokaystopCount",0);
addSaveVar("arenaCorruptScore",0);
addSaveVar("arenaCorruptDifficulty",1);
addSaveVar("arenaCorruptMaxDifficulty",20);
addSaveVar("arenaCorruptBestDifficulty",0);
addSaveVar("arenaCorruptWmDifficulty",1);
addSaveVar("arenaCorruptWmMaxDifficulty",1);
addSaveVar("arenaCorruptWmBestDifficulty",0);
addSaveVar("arenaCorruptToday",0);
addSaveVar("arenaCorruptHealth",50);
addSaveVar("arenaCorruptAttack",50);
addSaveVar("arenaCorruptDefense",50);
addSaveVar("arenaCorruptAccuracy",50);
addSaveVar("arenaCorruptEvasion",50);
addSaveVar("arenaZone",0);
addSaveVar("arenaZoneOrig",0);
addSaveVar("arenaMaxCombo",0);
addSaveVar("arenaBestiary",new Array());
addSaveVar("arenaBestiaryExtra",new Array());
addSaveVar("arenaBestiaryUlt1",new Array());
addSaveVar("arenaBestiaryUlt2",new Array());
addSaveVar("arenaBestiaryUlt3",new Array());
addSaveVar("arenaBestiaryUlt1V",new Array());
addSaveVar("arenaBestiaryUlt2V",new Array());
addSaveVar("arenaBestiaryUlt3V",new Array());
addSaveVar("arenaBestiaryUlt1F",new Array());
addSaveVar("arenaBestiaryUlt2F",new Array());
addSaveVar("arenaBestiaryUlt3F",new Array());
addSaveVar("arenaZoneFound",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("arenaZoneKill",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("arenaZoneChallenge",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("arenaAllyEXP",new Array());
addSaveVar("arenaAllyUpgrade",new Array());
addSaveVar("arenaAllyFavorite",new Array());
addSaveVar("arenaAlly",0);
addSaveVar("autoFight",false);
addSaveVar("arenaHardcore",false);
addSaveVar("arenaTurnBased",false);
addSaveVar("arenaDisplayMonsterStats",true);
addSaveVar("recipeLevel",0);
addSaveVar("secretRecipeLevel",0);
addSaveVar("arenaDeletedSlot",801);
addSaveVar("inventoryGuard",[false]);
addSaveVar("inventoryExist",[0]);
addSaveVar("inventorySet",[0]);
addSaveVar("inventoryName",["No Item"]);
addSaveVar("inventoryDesc",[""]);
addSaveVar("inventoryReqRank",[1]);
addSaveVar("inventoryLevel",[1]);
addSaveVar("inventoryMaxLevel",[1]);
addSaveVar("inventoryExp",[0]);
addSaveVar("inventoryExpTNL",[0]);
addSaveVar("inventoryEnhance",[0]);
addSaveVar("inventoryBonusPow",[0]);
addSaveVar("inventoryType",["Any"]);
addSaveVar("inventorySubtype",["Any"]);
addSaveVar("inventoryFrame",[0]);
addSaveVar("inventoryRange",[false]);
addSaveVar("inventoryAttack",[0]);
addSaveVar("inventorySpeed",[0]);
addSaveVar("inventoryDefense",[0]);
addSaveVar("inventoryBonus",[""]);
addSaveVar("inventoryAbility",[""]);
addSaveVar("inventoryMoreBonus",[""]);
addSaveVar("inventorySell",[0]);
addSaveVar("inventoryExpiry",[Infinity]);
addSaveVar("inventoryObtainTime",[0]);
addSaveVar("inventoryNoBonus",[false]);
addSaveVar("inventoryNoRecycle",[false]);
addSaveVar("inventoryNoFuse",[false]);
addSaveVar("inventoryNoUnique",[false]);
addSaveVar("inventorySpirit",[false]);
addSaveVar("inventoryCrit",[0]);
addSaveVar("inventoryDexterity",[0]);
addSaveVar("inventoryHealth",[0]);
addSaveVar("inventoryUnob",[0]);
addSaveVar("buttonGrandpa",0);
addSaveVar("buttonGrandpaSpeed",1);
addSaveVar("buttonGrandpaAccuracy",1);
addSaveVar("buttonGrandpaDiscipline",1);
addSaveVar("buttonGrandpaPress",0);
addSaveVar("buttonPress",0);
addSaveVar("buttonPressToday",0);
addSaveVar("buttonBreak",0);
addSaveVar("buttonPerfect",0);
addSaveVar("buttonPurple",0);
addSaveVar("buttonMaxCombo",0);
addSaveVar("buttonBroken",false);
addSaveVar("buttonBless",0);
addSaveVar("buttonBlessMode",1);
addSaveVar("buttonMultiplier",0);
addSaveVar("totalPrinterMoney",0);
addSaveVar("totalPrinterMillion",0);
addSaveVar("totalPrinterCharge",0);
addSaveVar("printerLevel",1);
addSaveVar("printerCharge",80);
addSaveVar("arcadeConfig1",true);
addSaveVar("arcadeConfig2",true);
addSaveVar("arcadeConfig3",true);
addSaveVar("arcadeConfig4",false);
addSaveVar("arcadeConfig5",true);
addSaveVar("arcadeConfig6",false);
addSaveVar("arcadeConfig7",false);
addSaveVar("arcadeMmrNoteSkin",0);
addSaveVar("arcadeDifficulty",[2,2,2,2,2,2,2,2,2,2]);
addSaveVar("arcadeTodayPercent",0);
addSaveVar("arcadeHighPercent",0);
addSaveVar("arcadeHighTrade",0);
addSaveVar("arcadeTradeIn",false);
addSaveVar("arcadeToken",25);
addSaveVar("arcadeBuyCount",0);
addSaveVar("arcade100kMedal",0);
addSaveVar("arcadeBless",0);
addSaveVar("arcadeBlessMode",1);
addSaveVar("arcadeRating",0);
addSaveVar("highRankedPong",[0,0,0]);
addSaveVar("highRankedAvoidance",[0,0,0]);
addSaveVar("highRankedMath",[0,0,0]);
addSaveVar("highRankedWhack",[0,0,0]);
addSaveVar("highRankedMind",[0,0,0]);
addSaveVar("highRankedBalance",[0,0,0]);
addSaveVar("highRankedCount",[0,0,0]);
addSaveVar("highRankedMMRX",[0,0,0]);
addSaveVar("highRankedPongDiff",[0,0,0]);
addSaveVar("highRankedAvoidanceDiff",[0,0,0]);
addSaveVar("highRankedMathDiff",[0,0,0]);
addSaveVar("highRankedWhackDiff",[0,0,0]);
addSaveVar("highRankedMindDiff",[0,0,0]);
addSaveVar("highRankedBalanceDiff",[0,0,0]);
addSaveVar("highRankedCountDiff",[0,0,0]);
addSaveVar("highRankedMMRXDiff",[0,0,0]);
addSaveVar("highPong",0);
addSaveVar("highAvoidance",0);
addSaveVar("highMath",0);
addSaveVar("highWhack",0);
addSaveVar("highMind",0);
addSaveVar("highBalance",0);
addSaveVar("highCount",0);
addSaveVar("highMMRX",0);
addSaveVar("rick",0);
addSaveVar("highMMR",[0,0,0,0,0,0,0,0,0,0]);
addSaveVar("highMMRSpecial",new Array());
addSaveVar("fcMMRSpecial",new Array());
addSaveVar("customSongStr","MMR Song #1 (MMR X Arr.)|???|Tukkun|113|65|16|26|29|30|17D1_1_1_1_2N1i1i1i1i2D4N1i1i1i1i2X1s1s1s1s2X1X1N1D1_1_1_1_1_2N1i1i1i1i2D1_1_1_1_1_1_1_1_1_1_1_1_4X1X1N1D1_1_1_1_1_2N1i1i1i1i2D4N1i1i1i1i2X1s1s1s1s2X1X1N1D1_1_1_1_1_2N1i1i1i1i2D1_1_1_1_8D0N0X1D0N0X3D0N0X1D0N0X2D0N0X5D2D2N2N2N2D1_1_1_1_1_1_1_1_1_1_10D2D2N2N1i1i4D2X1s1s2X2N1i1i1i1i1i1i6D2D2N2N2D2N2X4N2N2D1_1_1_1_1_1_6D2D2N2N2N2D4N2N2N2X2N1i1i1i1i4D1_1_1_1_1_1_1_1_2N2X2D2N2N2N2X2N4D1_1_1_1_8D2N2X2D4N2X2N1i1i1i1i2D1D1N1D1X1s2X1s2N1i1i1i1i2D1D1N1D1N1i2N1i2D1_1_1_1_2D1D1N1D1N1i1i2X2N1i1i1i1D0i4D2X1s1s2N1i1i1i1i1i1i2D1D1N1D1X1s2X1s2N1i1i1i1i2D1D1N1D1X1s1s2D2N1i1i1i1i2D1D1N1D1N1i1i2X2N1i1i1i1i4D2X1s1s2N1i1i2D0N0X1D0N0X3D0N0X1D0N0X3D1_1_1_1_1_1_1_1_1_1_1_1_1_1_2X1s2X1s2N1i1i1i1i6D1_1_1_1_1_1_1_1_1_1_1_1_1_1_2X1s2X1s2N1i1i1i1i6D1_1_0N1_0N1_0X1_0N1_0X1_1_0N1_0N1_0X1_0N1_0X1_1_2X1s2X1s2N1i1i1i1i6D1_1_0N1_0N1_0X1_0N1_0X1_1_0N1_0N1_0X1_0N1_0X1_1_2X1s2X1s2N1i1i1i1i6D4X4D4X4D4X4D4X4D4X4D4X4N0X1i0s1i0s1i0s1i0s2D0N1_0i1_0i1_0i1_0i1_0i1_0i1_0i1_0i2D4X4D4X4D4X4D4X4D4X4D4X4N0X1i0s1i0s1i0s1i0s2D0N2X1X1X1X1X1X1X2D1_1_1_1_1_1_1_1_1_1_1_1_4N1i1i1i1i1i1i1i1i0X1i0s1i0s1i0s1i0s4X1s1s1s1s1s1s1s1s1s1s1s1s4N1i1i1i1i1i1i1i1i1i3D1D1N1D1X1s2X1s2N1i1i1i1i2D1D1N1D1N1i2N1i2D1_1_1_1_2D1D1N1D1N1i1i2X2N1i1i1i1D0i4D2X1s1s2N1i1i1i1i1i1i2D1D1N1D1X1s2X1s2N1i1i1i1i2D1D1N1D1X1s1s2D2N1i1i1i1i2D1D1N1D1N1i1i2X2N1i1i1i1i4D2X1s1s2N1i1i1i1i1i1i2D1D1N1D1X1s2X1s2N1i1i1i1i2D1D1N1D1N1i2N1i2D1_1_1_1_2D1D1N1D1N1i1i2X2N1i1i1i1D0i4D2X1s1s2N1i1i1i1i1i1i2D1D1N1D1X1s2X1s2N1i1i1i1i2D1D1N1D1X1s1s2D2N1i1i1i1i2D1D1N1D1N1i1i2X2N1i1i1i1i4D2X1s1s2N1i1i1i1i1i1i1i1i|7P1L2L1L1L1P1P1P1P1B0F1]0a1]0a1]0a1]0a2L0P1g0k1g0k1g0k1g0k2B4L0P1g0k1g0k1g0k1g0k2V0Z1q0u1q0u1q0u1q0u2V0Z1V0Z1L0P1B0F1]0a1]0a1]0a1]0a1]0a2L0P1g0k1g0k1g0k1g0k2B1]1]1]1]1]1]1]1]1]1]1]1]2B1B1V0Z1V0Z1L0P1B0F1]0a1]0a1]0a1]0a1]0a2L0P1g0k1g0k1g0k1g0k2B4L0P1g0k1g0k1g0k1g0k2V0Z1q0u1q0u1q0u1q0u2V0Z1V0Z1L0P1B0F1]0a1]0a1]0a1]0a1]0a2L0P1g0k1g0k1g0k1g0k2B1]1]1]1]1]1]1]1]1]1]2B0L0P0Z1B0L0P0Z3B0L0P0Z1B0L0P0Z2B0L0P0Z1V1q1q1q1q0F1q1q0F1q1q0P1q1q0P1q1q0P1q1q0F1a1L0a1g0a1g0a1g0a1g0a1g0a1g0a1g0a1g0a1g1g1g1g1g1g2V1q1q0F1q1q0F1q1q0P1q1q0P1q0k1q0k1q1q1q1q0F2V0Z1q0u1q0u1q1q0Z2L0P1g0k1g0k1g0k1g0k1g0k1g0k1g1g2V1q1q0F1q1q0F1q1q0P1q1q0P1q1q0F1q1q0P1q1q0Z2L1g1g0P1g1g0P1g1g0F1g0a1g0a1g0a1g0a1g0a1g0a1g1g2L0V1g0q1g0q0F1g0q1g0q0F1g0q1g0q0P1g0q1g0q0P1g0q1g0q0P1g0q1g0q0F1g0q1g0q1g0q1g0q0P2B0V0P1]0q1]0q0P2B0L0Z1]0g1]0g0P1k1B0V0k1]0q0k1]0q0k2B0L2L0F1g0a1g0a1g0a1g0a1g0a1g0a1g0a1g0a1g1g0P1g1g0Z1g1g0F2B0P1]1]0P1]1]0P1]1]0Z1]1]0P1]1]1]1]0F1]0a1]0a1a1L0a1g1g1g1g1g1g1g1g0F1g1g0P1g1g0Z1g1g0F2V2P1V1Z2L0P1k1k1k1B0k1B1L0F1V0F1P1F1B0Z1]0u1]1]0Z1]0u2L0P1g0k1g0k1g0k1g0k2B0F1F1P1F1L0P1g0k1g1g0P1g0k2V0F1q0a1q0a1q0a1q0a2V0F1V0F1L0P1B0F1]0P1]0k1]0k1]1]0Z2L0P1g0k1g0k1g0k1g0F0k2B1]1]0F1]1]0Z1]0u1]0u1]1]0P1]0k1]0k1]0k1]0k1k1k2V0F1V0F1L0P1B0F1]0Z1]0u1]1]0Z1]0u2L0P1g0k1g0k1g0k1g0k2B0F1F1P1F1L0P0Z1g0k0u1g0k0u1g1g0F2V0P1q0k1q0k1q0k1q0k2V0F1V0F1L0P1B0F1]0P1]0k1]0k1]1]0Z2L0P1g0k1g0k1g0k1g0k2B1]1]0F1]1]0Z1]0u1]0u1]1]0P1k1k2B0L0P0Z1B0L0P0Z3B0L0P0Z1B0L0P0Z3B1]1]1]1]1]1]1]1]1]1]1]1]1]1]2L0Z1g0u2L0Z1g0u2B0P1]0k1]0k1]0k1]0k6B1]1]1]1]1]1]1]1]1]1]1]1]1]1]2L0Z1g0u2L0Z1g0u2B0P1]0k1]0k1]0k1]0k6B1]1]0F1]0F1]0P1]0F1]0Z1]1]0F1]0F1]0P1]0F1]0Z1]1]2L0Z1g0u2L0Z1g0u2B0P1]0k1]0k1]0k1]0k6B1]1]0F1]0F1]0P1]0F1]0Z1]1]0F1]0F1]0P1]0F1]0Z1]1]2L0Z1g0u2L0Z1g0u2B0P1]0k1]0k1]0k1]0k8P2P2F2P2Z1u1u4P2P2F1a1a1a1a1a1a1a1a6P2P2P2Z2P2F1a1a2L0V1g0q1g0q0P0Z1g0q1g0q0P0Z2B0L0F0P1]0g0a0k1]0g0a0k1]0g1]0g0P0Z1]0g1]0g0F0Z1]0g1]0g0F0P4P2P2F2P2F2P2Z1u1u2P2P2F1a1a1a1a1a1a1a1a4P2P2P2Z2P2F4L0V1g0q1g0q0F0P1g0q1g0q0P0Z2B0L0P0Z1k0u1V0k0u1V1V0F0P1V0a0k1V0a0k1V1V2B0F1a1L0a1a1B0a1a1L0a1L0a1L0a2L0P2B0Z2L0F2B0P2L0P2B0P2L0Z1L1P2L2B0F1a1L0a1L0a1B0a2L2B2L1L1L0F2L0P2B0Z2L0F2B2L0P2B0Z2L0P1L0k1L0k1L0k1L0k1L1V0F1V0F1V0P1V0F1B0Z1]0u1]1]0Z1]0u2L0P1g0k1g0k1g0k1g0k2B0F1F1P1F1L0P1g0k1g1g0P1g0k2V0F1q0a1q0a1q0a1q0a2V0F1V0F1L0P1B0F1]0P1]0k1]0k1]1]0Z2L0P1g0k1g0k1g0k1g0F0k2B1]1]0F1]1]0Z1]0u1]0u1]1]0P1]0k1]0k1]0k1]0k1k1k2V0F1V0F1L0P1B0F1]0Z1]0u1]1]0Z1]0u2L0P1g0k1g0k1g0k1g0k2B0F1F1P1F1L0P0Z1g0k0u1g0k0u1g1g0F2V0P1q0k1q0k1q0k1q0k2V0F1V0F1L0P1B0F1]0P1]0k1]0k1]1]0Z2L0P1g0k1g0k1g0k1g0k2B1]1]0F1]1]0Z1]0u1]0u1]1]0P1k1k1k1B0L0k1B0L3B0L0F1B0L0F1P1F1B0Z1]0u1]1]0Z1]0u2L0P1g0k1g0k1g0k1g0k2B0F1F1P1F1L0P1g0k1g1g0P1g0k2V0F1q0a1q0a1q0a1q0a2V0F1V0F1L0P1B0F1]0P1]0k1]0k1]1]0Z2L0P1g0k1g0k1g0k1g0F0k2B1]1]0F1]1]0Z1]0u1]0u1]1]0P1]0k1]0k1]0k1]0k1k1k2V0F1V0F1L0P1B0F1]0Z1]0u1]1]0Z1]0u2L0P1g0k1g0k1g0k1g0k2B0F1F1P1F1L0P0Z1g0k0u1g0k0u1g1g0F2V0P1q0k1q0k1q0k1q0k2V0F1V0F1L0P1B0F1]0P1]0k1]0k1]1]0Z2L0P1g0k1g0k1g0k1g0k4B0F2V0Z1q0u1q0u2L0P1g0k1g0k1g0k1g0k1g0k1g0k1g0k1g0k|7N1N2N1N1N1N1N1N1N1A0G1%0b1%0b1%0b1%0b2K0Q1f0l1f0l1f0l1f0l2A4K0Q1f0l1f0l1f0l1f0l2U0[1p0v1p0v1p0v1p0v2U0[1U0[1K0Q1A0G1%0b1%0b1%0b1%0b1%0b2K0Q1f0l1f0l1f0l1f0l2A1%1%1%1%1%1%1%1%1%1%1%1%2K1K1[1[1Q1A0G1%0b1%0b1%0b1%0b1%0b2K0Q1f0l1f0l1f0l1f0l2A4K0Q1f0l1f0l1f0l1f0l2U0[1p0v1p0v1p0v1p0v2U0[1U0[1K0Q1A0G1%0b1%0b1%0b1%0b1%0b2K0Q1f0l1f0l1f0l1f0l2A1%1%1%1%1%1%1%1%1%1%2K0U0D0X0G0Q1K0U0D0X0G0Q3K0U0D0X0G0Q1K0U0D0X0G0Q2K0U0D0X0G0Q1U1p1p1p1p0G1p1p0G1p1p0Q1p1p0Q1p1p0Q1p1p0G1b1K0b1f0X0b1f0X1f0s1f0s1f0s1f0s1f0s1f0s1f1f1f1f1f1f2U1p1p0G1p1p0G1p1p0Q1p1p0Q1p0l1p0G0l1p0b1p0b1p1p0X2U0[1p0v1p0v1p1p0[1v1K0Q0v1f0l0v1f0l0v1f0l0v1f0l0v1f0l0v1f0l0v1f0l0v1f0l0v2U1p1p0G1p1p0G1p1p0Q1p1p0Q1p1p0G1p1p0Q1p1p0[2K1f1f0Q1f1f0Q1f1f0Q1f0l1f0G0l1f0b1f0b1f0b1f0b1f0b1f0b2U0N1p0i1p0i0G1p0i1p0i0G1p0i1p0i0Q1p0i1p0i0Q1p0i1p0i0Q1p0i1p0i0G1p0i1p0i1p0i1p0i0Q2U0D0Q1p0_1p0_0Q2K0D0[1f0_1f0_0Q1l1K0U0l1f0p0l1f0p0l2A0U2A0G1b1K0b1b1A0b1b1K0b1K0b1K0b2K0Q2A0[2K0G2A0Q2K0Q2A0Q2K0[1K1Q2K0G2A0G1b1K0b1K0b1A0b2K2A2K1K1K0G2K0Q2A0[2K0G2A2K0Q2A0[2K0Q1K0l1K0l1K0l1K0l1K1U0G1U0G1U0Q1U0G1A0Q0[1%0l0v1%1%0Q0[1%0l0v2K0G0[1f0b0v1f0b0v1f0b0v1f0b0v2A0G1G1Q1G1K0G0[1f0b0v1f1f0G0[1f0b0v2U0G0Q1p0b0l1p0b0l1p0b0l1p0b0l2U0G1U0G1K0Q1A0G1%0Q1%0l1%0l1%1%0[2K0Q1f0l1f0l1f0l1f0G0l2A1%1%0G1%1%0[1%0v1%0v1%1%0Q1%0l1%0l1%0l1%0l1l1K0l1K1G1G1Q1A0G1%0Q0[1%0l0v1%1%0Q0[1%0l0v2K0G0[1f0b0v1f0b0v1f0b0v1f0b0v2A0G1G1Q1G1K0Q0[1f0l0v1f0l0v1f1f0G0Q2U0G0[1p0b0v1p0b0v1p0b0v1p0b0v2U0G1U0G1K0Q1A0G1%0Q1%0l1%0l1%1%0[2K0Q1f0l1f0l1f0l1f0G0l2A1%1%0G1%1%0[1%0v1%0v1%1%0Q1l1l2K0U0D0X0G0Q1K0U0D0X0G0Q3K0U0D0X0G0Q1K0U0D0X0G0Q3N1i1i1i1i1i1i1i1i1i1i1i1i1i1D1U1N0G0[1i0b0v2N0G0[1i0b0v2D0X0Q1_0s0l1_0s0l1_0s0l1_0s0l2K1f1f1f1N1i1i1i1i1i1i1i1i1i1i1i1i1i1D1U1N0G0[1i0b0v2N0G0[1i0b0v2D0X0Q1_0s0l1_0s0l1_0s0l1_0s0l6N1i1A0i1A0i1K0i1A0i1U0i1i1A0i1A0i1K0i1A0i1U0i1i1D1U1N0G0[1i0b0v2N0G0[1i0b0v2D0X0Q1_0s0l1_0s0l1_0s0l1_0s0l6N1i1A0i1A0i1K0i1A0i1U0i1i1A0i1A0i1K0i1A0i1U0i1i1D1U1N0G0[1i0b0v2N0G0[1i0b0v2D0X0Q1_0s0l1_0s0l1_0s0l1_0s0l4X1X1D2X2D2X1X1X2X2D2X2D2X2D2X1X3X2D2X1X1D2X2D2X1X1X2X2D2X2D0Q0[1l0v1X0l0v1l0v1D0l0v2X0G0Q1X0b0l1b0l1b0l1X0b0l1b0l1D0b0l1b0l1X0b0l1X1D2X2D2X1X1X2X2D2X2D2X2D2X1X3X2D2X1X1D2X2D2X1X1X2X2D2X2D0Q0[1l0v1X0l0v1l0v1D0l0v2X0G0Q1X0b0l1D0b0l1D0b0l1D0b0l1D0b0l1D0b0l1D0b0l1D0b0l2G1b1K0b1b1b1K0b1b1K0b1b2K0Q2[1K1G1K1Q2K0Q2Q1K1[1K1Q1l1K0G0l2G1K0b1b1K0b1b2K3K2K1G2K0Q2[1K1G1K3K0Q2[1K1Q1K0l1l1l1K0l2G1G1Q1G1A0Q0[1%0l0v1%1%0Q0[1%0l0v2K0G0[1f0b0v1f0b0v1f0b0v1f0b0v2A0G1G1Q1G1K0G0[1f0b0v1f1f0G0[1f0b0v2U0G0Q1p0b0l1p0b0l1p0b0l1p0b0l2U0G1U0G1K0Q1A0G1%0Q1%0l1%0l1%1%0[2K0Q1f0l1f0l1f0l1f0G0l2A1%1%0G1%1%0[1%0v1%0v1%1%0Q1%0l1%0l1%0l1%0l1l1K0l1K1G1G1Q1A0G1%0Q0[1%0l0v1%1%0Q0[1%0l0v2K0G0[1f0b0v1f0b0v1f0b0v1f0b0v2A0G1G1Q1G1K0Q0[1f0l0v1f0l0v1f1f0G0Q2U0G0[1p0b0v1p0b0v1p0b0v1p0b0v2U0G1U0G1K0Q1A0G1%0Q1%0l1%0l1%1%0[2K0Q1f0l1f0l1f0l1f0G0l2A1%1%0G1%1%0[1%0v1%0v1%1%0Q1l1l2G0Q1G0Q1K1K1G1G1Q1A0G1A0Q0[1%0l0v1%1%0Q0[1%0l0v2K0G0[1f0b0v1f0b0v1f0b0v1f0b0v2A0G1G1Q1G1K0G0[1f0b0v1f1f0G0[1f0b0v2U0G0Q1p0b0l1p0b0l1p0b0l1p0b0l2U0G1U0G1K0Q1A0G1%0Q1%0l1%0l1%1%0[2K0Q1f0l1f0l1f0l1f0G0l2A1%1%0G1%1%0[1%0v1%0v1%1%0Q1%0l1%0l1%0l1%0l1l1K0l1K1G1G1Q1A0G1%0Q0[1%0l0v1%1%0Q0[1%0l0v2K0G0[1f0b0v1f0b0v1f0b0v1f0b0v2A0G1G1Q1G1K0Q0[1f0l0v1f0l0v1f1f0G0Q2U0G0[1p0b0v1p0b0v1p0b0v1p0b0v2U0G1U0G1K0Q1A0G1%0Q1%0l1%0l1%1%0[2K0Q1f0l1f0l1f0l1f0G0l4A0G2U0[1p0v1p0v2K0Q1f0l1f0l1f0l1f0l1f0l1f0l1f0l1f0l|7N0X1D0N2D0N1D0N1D0N1N0X1N0X1N0X1N0X1A0G1%0b1%0b1%0b1%0b2K0Q1f0l1f0l1f0l1f0l2A4K0Q1f0l1f0l1f0l1f0l2U0[1p0v1p0v1p0v1p0v2U0[1U0[1K0Q1A0G1%0b1%0b1%0b1%0b1%0b2K0Q1f0l1f0l1f0l1f0l2A1%1%1%1%0G1%0b1%0b1%0b1%0b1%1%0Q1%0l1%0l2K1K1K0U0[1K0U0[1Q1A0K0G1%0b1%0b1%0b1%0b1%0b2K0Q1f0l1f0l1f0l1f0l2A4K0Q1f0l1f0l1f0l1f0l2U0[1p0v1p0v1p0v1p0v2U0[1U0[1K0Q1A0G1%0b1%0b1%0b1%0b1%0b2K0Q1f0l1f0l1f0l1f0l2A1%1%1%1%0G1%0b1%0b1%0b1%0b1%0b1%0b2K0U0D0X0G0Q1K0U0D0X0G0Q3K0U0D0X0G0Q1K0U0D0X0G0Q2K0U0D0X0G0Q1U1p1p1p1p0G1p1p0G1p1p0Q1p1p0Q1p1p0Q1p1p0G1b1K0b1f0X0b1f0X1f0s1f0s1f0s1f0s1f0s1f0s1f1f1f1f1f1f2U1p1p0G1p1p0G1p1p0Q1p1p0Q1p0l1p0G0l1p0b1p0b1p1p0X2U0[1p0v1p0v1p1p0[1v1Q0v1l0v1X0l0v1s0l0v1N0s0l0v1i0s0l0v1U0i0s0l0v1p0i0s0l0v1K0p0i0s0l0v2U1p1p0G1p1p0G1p1p0Q1p1p0Q1p1p0G1p1p0Q1p1p0[2K1f1f0Q1f1f0Q1f1f0Q1f0l1f0G0l1f0b1f0b1f0b1f0b1f0b1f0b2U0N1p0i1p0i0G1p0i1p0i0G1p0i1p0i0Q1p0i1p0i0Q1p0i1p0i0Q1p0i1p0i0G1p0i1p0i1p0i1p0i0Q2U0D0Q1p0_1p0_0Q2K0D0[1f0_1f0_0Q1l1K0U0l1f0p0l1f0p0l2A0U2A0G1b1K0b1b1A0b1b1K0b1K0b1K0b2K0Q2A0[2K0G2A0Q2K0Q2A0Q2K0[1K1Q1l1K0G0l1l1A0G0l1b1K0b1K0b1A0b2K2A2K1K1K0G2K0Q2A0[2K0G2A2K0Q2A0[2K0Q1K0l1K0l1K0l1K0l1K1U0G1U0G1U0Q1U0G1A0Q0[1%0l0v1%1%0Q0[1%0l0v2K0G0[1f0b0v1f0b0v1f0b0v1f0b0v2A0G1G1Q1G1K0G0[1f0b0v1f1f0G0[1f0b0v2U0G0Q1p0b0l1p0b0l1p0b0l1p0N0b0l2U0G1U0G1K0Q1A0G1%0Q1%0l1%0l1%1%0[2K0Q1f0l1f0l1f0l1f0G0l2A1%1%0G1%1%0[1%0v1%0v1%1%0Q1%0l1%0l1%0l1%0l1l1K0l1K1K0U0G1K0U0G1Q1A0K0G1%0Q0[1%0l0v1%1%0Q0[1%0l0v2K0G0[1f0b0v1f0b0v1f0b0v1f0b0v2A0G1G1Q1G1K0Q0[1f0l0v1f0l0v1f1f0G0Q2U0G0[1p0b0v1p0b0v1p0b0v1p0N0b0v2U0G1U0G1K0Q1A0G1%0Q1%0l1%0l1%1%0[2K0Q1f0l1f0l1f0l1f0G0l2A1%1%0G1%1%0[1%0v1%0v1%1%0Q1l1l2K0U0D0X0G0Q1K0U0D0X0G0Q3K0U0D0X0G0Q1K0U0D0X0G0Q3A0N1%0i1%0i1A0i1%0i1%0i1A0i1%0i1A0i1%0i1%0i1A0i1%0i1%0i1A0D1%0U1N0G0[1i0b0v2N0G0[1i0b0v2D0X0Q1_0s0l1_0s0l1_0s0l1_0s0l2K1f1f1f1A0N1%0i1%0i1A0i1%0i1%0i1A0i1%0i1A0i1%0i1%0i1A0i1%0i1%0i1A0D1%0U1N0G0[1i0b0v2N0G0[1i0b0v2D0X0Q1_0s0l1_0s0l1_0s0l1_0s0l6N1i1A0i1A0i1K0i1A0i1U0i1i1A0i1A0i1K0i1A0i1U0i1i1D1U1N0G0[1i0b0v2N0G0[1i0b0v2D0X0Q1_0s0l1_0s0l1_0s0l1_0s0l6N1i1A0i1A0i1K0i1A0i1U0i1i1A0i1A0i1K0i1A0i1U0i1i1D1U1N0G0[1i0b0v2N0G0[1i0b0v2D0X0Q1_0s0l1N1N1N1N1N2X1X1D2X2D2X1X1X2X2D2X2D2X2D2X1X3X2D2X1X1D2X2D2X1X1X2X2D2X2D0Q0[1l0v1X0l0v1l0v1D0l0v2X0G0Q1X0b0l1b0l1b0l1X0b0l1b0l1D0b0l1b0l1X0b0l1X1D2X2D2X1X1X2X2D2X2D2X2D2X1X3X2D2X1X1D2X2D2X1X1X2X2D2X2D0Q0[1l0v1X0l0v1l0v1D0l0v2X0G0Q1X0b0l1D0N0b0l1D0N0b0l1D0N0b0l1D0N0b0l1D0N0b0l1D0N0b0l1D0N0b0l2G1b1K0U0b1b1b1K0U0b1b1K0U0b1b2K0U0Q2[1K0U1G1K0U1Q2K0U0Q2Q1K0U1[1K0U1Q1l1K0U0G0l2G1K0U0b1b1K0U0b1b2K0U3K0U2K0U1G2K0U0Q2[1K0U1G1K0U3K0U0Q2[1K0U1Q1K0U0l1l1l1A0K0l2A0U0G1K0U0G1Q1K0U0G1A0Q0[1%0l0v1%1%0Q0[1%0l0v2K0G0[1f0b0v1f0b0v1f0b0v1f0b0v2A0G1G1Q1G1K0G0[1f0b0v1f1f0G0[1f0b0v2U0G0Q1p0b0l1p0b0l1p0b0l1p0N0b0l2U0G1U0G1K0Q1A0G1%0Q1%0l1%0l1%1%0[2K0Q1f0l1f0l1f0l1f0G0l2A1%1%0G1%1%0[1%0v1%0v1%1%0Q1%0l1%0l1%0l1%0l1l1K0l1K1K0U0G1K0U0G1Q1A0K0G1%0Q0[1%0l0v1%1%0Q0[1%0l0v2K0G0[1f0b0v1f0b0v1f0b0v1f0b0v2A0G1G1Q1G1K0Q0[1f0l0v1f0l0v1f1f0G0Q2U0G0[1p0b0v1p0b0v1p0b0v1p0N0b0v2U0G1U0G1K0Q1A0G1%0Q1%0l1%0l1%1%0[2K0Q1f0l1f0l1f0l1f0G0l2A1%1%0G1%1%0[1%0v1%0v1%1%0Q1l1l2X0G0Q1X0G0Q1K1K1K0U0G1K0U0G1Q1A0K0G1A0Q0[1%0l0v1%1%0Q0[1%0l0v2K0G0[1f0b0v1f0b0v1f0b0v1f0b0v2A0G1G1Q1G1K0G0[1f0b0v1f1f0G0[1f0b0v2U0G0Q1p0b0l1p0b0l1p0b0l1p0N0b0l2U0G1U0G1K0Q1A0G1%0Q1%0l1%0l1%1%0[2K0Q1f0l1f0l1f0l1f0G0l2A1%1%0G1%1%0[1%0v1%0v1%1%0Q1%0l1%0l1%0l1%0l1l1K0l1K1K0U0G1K0U0G1Q1A0K0G1%0Q0[1%0l0v1%1%0Q0[1%0l0v2K0G0[1f0b0v1f0b0v1f0b0v1f0b0v2A0G1G1Q1G1K0Q0[1f0l0v1f0l0v1f1f0G0Q2U0G0[1p0b0v1p0b0v1p0b0v1p0N0b0v2U0G1U0G1K0Q1A0G1%0Q1%0l1%0l1%1%0[2K0Q1f0l1f0l1f0l1f0G0l4A0G2U0[1p0v1p0v2K0Q1f0l1f0l1f0l1f0l1f0l1f0l1f0l1f0l|!");
addSaveVar("rankedPong",0);
addSaveVar("rankedAvoidance",0);
addSaveVar("rankedMath",0);
addSaveVar("rankedWhack",0);
addSaveVar("rankedMind",0);
addSaveVar("rankedBalance",0);
addSaveVar("rankedCount",0);
addSaveVar("rankedMMRX",0);
addSaveVar("rankedMode",true);
addSaveVar("unrankedPower",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("totalPong",0);
addSaveVar("totalAvoidance",0);
addSaveVar("totalMath",0);
addSaveVar("totalWhack",0);
addSaveVar("totalMind",0);
addSaveVar("totalBalance",0);
addSaveVar("totalCount",0);
addSaveVar("totalMMR",0);
addSaveVar("totalMMRX",0);
addSaveVar("todayHighPong",0);
addSaveVar("todayHighAvoidance",0);
addSaveVar("todayHighMath",0);
addSaveVar("todayHighWhack",0);
addSaveVar("todayHighMind",0);
addSaveVar("todayHighBalance",0);
addSaveVar("todayHighCount",0);
addSaveVar("todayHighMMRX",0);
addSaveVar("todayParPong",1400000);
addSaveVar("todayParAvoidance",500000);
addSaveVar("todayParMath",1000000);
addSaveVar("todayParWhack",1500000);
addSaveVar("todayParMind",2000000);
addSaveVar("todayParBalance",2800000);
addSaveVar("todayParCount",6000000);
addSaveVar("stadiumRunescape",0);
addSaveVar("stadiumToken",0);
addSaveVar("stadiumTokenMax",0);
addSaveVar("stadiumAbilityCost",0);
addSaveVar("stadiumRace",0);
addSaveVar("stadiumItem",0);
addSaveVar("stadiumDeathMatch",0);
addSaveVar("stadiumBestDeathMatch",0);
addSaveVar("stadiumTodayDeathMatch",0);
addSaveVar("stadiumBestTime",999999);
addSaveVar("stadiumBetCorrect",0);
addSaveVar("stadiumBetStreak",0);
addSaveVar("stadiumBetMaxStreak",0);
addSaveVar("stadiumBetWinningCoin",0);
addSaveVar("stadiumBetWinningToken",0);
addSaveVar("stadiumEnergy",0);
addSaveVar("stadiumAccel",0);
addSaveVar("stadiumMaxSpeed",0);
addSaveVar("stadiumStartSpeed",0);
addSaveVar("stadiumDash",0);
addSaveVar("stadiumJump",0);
addSaveVar("stadiumBoost",0);
addSaveVar("stadiumReward",0);
addSaveVar("stadiumFace",2);
addSaveVar("stadiumHat",1);
addSaveVar("stadiumHatOwned",[0,0,0,0,0,0]);
addSaveVar("stadiumBless",0);
addSaveVar("stadiumBlessMode",1);
addSaveVar("stadiumImpossibleRace",0);
addSaveVar("stadiumImpossibleItem",0);
addSaveVar("antsSprayed",0);
addSaveVar("epicSkill",[0,0,0,0,0,0,0,0,0,0,0]);
if(isNaN(_root.save.epicSkill[1]))
{
   _root.save.epicSkill = [0,0,0,0,0,0,0,0,0,0,0];
}
addSaveVar("banPenalty",[0,0,0,0,0,0,0,0,0,0,0]);
if(isNaN(_root.save.banPenalty[1]))
{
   _root.save.banPenalty = [0,0,0,0,0,0,0,0,0,0,0];
}
addSaveVar("totalStupidity",0);
addSaveVar("remStupidity",0);
addSaveVar("ascStupidity",0);
addSaveVar("ascMilestone",0);
addSaveVar("stupidity",0);
addSaveVar("permaStupidity",0);
addSaveVar("permaStupidityHard",0);
addSaveVar("permaStupidityImpossible",0);
addSaveVar("permaBanPenalty",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("permaBanMax",0);
addSaveVar("permaBanRes",1);
addSaveVar("curBanRefID",201508);
addSaveVar("curSheetID",201507);
addSaveVar("curDateID",1);
addSaveVar("curAttStamp",0);
addSaveVar("curAttMiss",0);
addSaveVar("curAttMedPend",0);
addSaveVar("lolConfig1",1);
addSaveVar("lolConfig2",3);
addSaveVar("lolConfig3",false);
addSaveVar("lolCapacity",50);
addSaveVar("lolProfit",0);
addSaveVar("lolCooldown",0);
addSaveVar("lolMaxProfit",0);
if(isNaN(_root.save.lolGems[1]) && _root.save.lolGems != undefined)
{
   _root.save.lolGems = undefined;
}
addSaveVar("lolGems",[0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("lolDemand",[0,2,3,4,5,6,7,8,9,10,11]);
addSaveVar("lolPrice",[0,1500,3000,4500,6000,7500,9000,10500,12000,13500,15000]);
addSaveVar("lolSpent",[0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("fcgInitDeck",0);
addSaveVar("fcgSpeed",10);
addSaveVar("fcgLevel",1);
addSaveVar("fcgExp",0);
addSaveVar("fcgExpTotal",0);
addSaveVar("fcgCash",1250);
addSaveVar("fcgMaxCash",1250);
addSaveVar("fcgPlay",0);
addSaveVar("fcgWin",0);
addSaveVar("fcgLose",0);
addSaveVar("fcgStreak",0);
addSaveVar("fcgMaxStreak",0);
addSaveVar("fcgRandomDeck",false);
addSaveVar("fcgReceiveChallenge",true);
addSaveVar("fcgPowerActive",true);
if(isNaN(_root.save.fcgOwned[1]) && _root.save.fcgOwned == undefined)
{
   _root.save.fcgOwned = undefined;
   _root.save.fcgDeck = undefined;
}
addSaveVar("fcgRewardedLevel",1);
addSaveVar("fcgMission",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("fcgMissionScore",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("fcgMissionGold",0);
addSaveVar("fcgBuff",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("fcgPower",[false,false,false,false,false,false,false,false,false]);
addSaveVar("fcgOwned",[0,0,0,5,0,5,0,5,0,5,0,5,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,2,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("fcgDeck",[0,0,0,5,0,5,0,5,0,5,0,5,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,2,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,1,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
if(isNaN(_root.save.fcgOwned[400]))
{
   _root.save.fcgOwned[400] = 0;
   _root.save.fcgDeck[400] = 0;
}
addSaveVar("fcgCurDiff",0);
addSaveVar("fcgLastDiff",0);
addSaveVar("fcgLevel0",0);
addSaveVar("fcgLevel1",0);
addSaveVar("fcgLevel2",0);
addSaveVar("fcgLevel3",0);
addSaveVar("fcgLevel4",0);
addSaveVar("fcgLevel5",0);
addSaveVar("fcgLevel6",0);
addSaveVar("fcgLevel7",0);
addSaveVar("fcgLevel8",0);
addSaveVar("fcgLevel9",0);
addSaveVar("fcgLevel10",0);
addSaveVar("fcgStreak0",0);
addSaveVar("fcgStreak1",0);
addSaveVar("fcgStreak2",0);
addSaveVar("fcgStreak3",0);
addSaveVar("fcgStreak4",0);
addSaveVar("fcgStreak5",0);
addSaveVar("fcgStreak6",0);
addSaveVar("fcgStreak7",0);
addSaveVar("fcgStreak8",0);
addSaveVar("fcgStreak9",0);
addSaveVar("fcgStreak10",0);
addSaveVar("fcgMaxStreak0",0);
addSaveVar("fcgMaxStreak1",0);
addSaveVar("fcgMaxStreak2",0);
addSaveVar("fcgMaxStreak3",0);
addSaveVar("fcgMaxStreak4",0);
addSaveVar("fcgMaxStreak5",0);
addSaveVar("fcgMaxStreak6",0);
addSaveVar("fcgMaxStreak7",0);
addSaveVar("fcgMaxStreak8",0);
addSaveVar("fcgMaxStreak9",0);
addSaveVar("fcgMaxStreak10",0);
addSaveVar("fcgLegendCount",0);
addSaveVar("fcgLegendDeck",0);
addSaveVar("fcgLegendLife",0);
addSaveVar("fcgSeriousDeck",34 + random(35));
addSaveVar("fcgTotalCards",52);
addSaveVar("fcgPack1",1);
addSaveVar("fcgPack1Cost",0);
addSaveVar("fcgPack2",1);
addSaveVar("fcgPack2Cost",0);
addSaveVar("fcgPack3",1);
addSaveVar("fcgPack3Cost",0);
addSaveVar("fcgPack4",1);
addSaveVar("fcgPack4Cost",0);
addSaveVar("fcgPack5",1);
addSaveVar("fcgPack5Cost",0);
addSaveVar("fcgCollection",0);
addSaveVar("awesomeBless",250);
addSaveVar("awesomeAuto",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("awesomeRedCoin",0);
addSaveVar("awesomeTotalRun",0);
addSaveVar("awesomeBestRun",0);
addSaveVar("awesomeBestRun1",0);
addSaveVar("awesomeBestRun2",0);
addSaveVar("awesomeBestRun3",0);
addSaveVar("awesomeBestRun4",0);
addSaveVar("awesomeTotalAdv",0);
addSaveVar("awesomeTotalAdv1",0);
addSaveVar("awesomeTotalAdv2",0);
addSaveVar("awesomeTotalAdv3",0);
addSaveVar("awesomeTotalAdv4",0);
addSaveVar("awesomeEnergy",5);
addSaveVar("awesomeMaxEnergy",5);
addSaveVar("awesomeReputation",0);
addSaveVar("awesomeMaxReputation",0);
addSaveVar("awesomeEnergyNext",60);
addSaveVar("awesomeRefill",1);
addSaveVar("grammarPill",0);
addSaveVar("specialPetFood",0);
addSaveVar("nextWizard",0);
addSaveVar("fishRod",1);
addSaveVar("fishCapacity",2500);
addSaveVar("fishRodUnlock",[0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("fishLevel",1);
addSaveVar("fishBestLevel",1);
addSaveVar("fishExamReduce",0);
addSaveVar("fishExamLeft",-1);
addSaveVar("fishExamPerfect",0);
addSaveVar("fishExamStreak",0);
addSaveVar("fishExamPerfectReq",0);
addSaveVar("fishExamStreakReq",0);
addSaveVar("fishExamRod",-1);
addSaveVar("fishShield",0);
addSaveVar("fishExp",0);
addSaveVar("fishTotalExp",0);
addSaveVar("fishFatigue",0);
addSaveVar("fishStreak",0);
addSaveVar("fishBestStreak",0);
addSaveVar("fishPerfect",0);
addSaveVar("fishTotal",0);
addSaveVar("fishScore",0);
addSaveVar("fishScoreToday",0);
addSaveVar("fishScoreRecord",0);
addSaveVar("fishMilestoneTotal",0);
addSaveVar("fishMilestoneToday",0);
addSaveVar("fishFound",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("fishLeft",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("fishPetFishCooldown",50);
addSaveVar("fishPetFoodCooldown",3);
addSaveVar("fishFoodCooldown",100);
addSaveVar("fishDrinkCooldown",3);
addSaveVar("artifact",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("souvenir",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("raidPyramid",0);
addSaveVar("raidDefend",0);
addSaveVar("raidPrehistoric",0);
addSaveVar("raidMegaboss",0);
addSaveVar("raidTower",0);
addSaveVar("raidDungeon",0);
addSaveVar("raidEndless",0);
addSaveVar("raidEndlessSpeedrun",2147483647);
addSaveVar("raidEndlessSpeedrunHC",2147483647);
addSaveVar("raidEndlessWM",0);
addSaveVar("raidSpecial",0);
addSaveVar("arenaRevengeScore",0);
addSaveVar("arenaTriangleScore",0);
addSaveVar("arenaTriangleToday",0);
addSaveVar("apocSecretKill",0);
addSaveVar("strangeBoxKill",0);
addSaveVar("triangleLandKill",0);
addSaveVar("triangleShoot",0);
addSaveVar("arenaEnhancerFragment",0);
addSaveVar("arenaChaoticFragment",0);
addSaveVar("deathMatchEntry",1);
addSaveVar("dragonReward",0);
addSaveVar("feedToday",0);
addSaveVar("feedTotal",0);
addSaveVar("feedMeter",0);
addSaveVar("wisdomDiscovered",new Array());
addSaveVar("arenaNerfGem",0);
addSaveVar("arenaNerfCount",0);
addSaveVar("arenaNerfNext",1000);
addSaveVar("arenaSpookyKey",false);
addSaveVar("arenaSpookyScore",0);
addSaveVar("arenaSpookyToday",0);
addSaveVar("arenaCraftUsed",0);
addSaveVar("ripoffCardUsed",0);
addSaveVar("careerBoost",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("careerActive",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("careerLevel",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("careerEXP",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("careerPotion",0);
addSaveVar("megaCareerPotion",0);
addSaveVar("curBusiness",0);
addSaveVar("curBusinessOffline",0);
addSaveVar("curBusinessOnline",0);
addSaveVar("curBusinessActivity",0);
addSaveVar("businessHigh",0);
addSaveVar("businessTotal",0);
addSaveVar("businessEXP",[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
addSaveVar("progBoxAsc",0);
addSaveVar("progBoxNext",0);
addSaveVar("refillAsc",0);
addSaveVar("refillNext",0);
addSaveVar("cheat",0);
addSaveVar("knowledge",0);
addSaveVar("theGame",0);
addSaveVar("mada",0);
addSaveVar("mbma",0);
addSaveVar("comboWaster",0);
addSaveVar("support",0);
addSaveVar("walkthru",0);
addSaveVar("escaped",0);
addSaveVar("pwned",0);
addSaveVar("petFeederBadge",0);
addSaveVar("revenger",0);
addSaveVar("ghostCount",0);
addSaveVar("hubertCount",0);
addSaveVar("seriousBusiness",0);
addSaveVar("survivor",0);
addSaveVar("forestDestroyer",0);
addSaveVar("curForestDestroyer",0);
addSaveVar("greed",0);
addSaveVar("lolBug",0);
addSaveVar("perfectionist",0);
addSaveVar("immortality",0);
addSaveVar("failproof",0);
addSaveVar("nightmare",0);
addSaveVar("artificialStupidity",0);
addSaveVar("moneySprayer",0);
addSaveVar("experienced",0);
addSaveVar("doingItWrong",0);
addSaveVar("curDoingItWrong",0);
addSaveVar("virtue",0);
addSaveVar("noHelp",0);
addSaveVar("randomGhost",0);
addSaveVar("nowUseless",0);
addSaveVar("chuckNorris",0);
addSaveVar("aceFinish",0);
addSaveVar("noDeath",0);
addSaveVar("pacifist",0);
addSaveVar("wakeUp",0);
addSaveVar("awesomeMineQuest",0);
addSaveVar("bestWpm",0);
addSaveVar("breakNewsMode",1);
addSaveVar("bouncyLoot",true);
addSaveVar("rangeAnimate",true);
addSaveVar("damageDisplay",true);
addSaveVar("damageFullDisplay",true);
addSaveVar("showBanner",true);
addSaveVar("showGain",true);
addSaveVar("showRobaconEXP",true);
addSaveVar("enableTip",true);
addSaveVar("activityLoot",false);
addSaveVar("enableMilestone",true);
addSaveVar("showProgBar",true);
addSaveVar("noob",0);
addSaveVar("ver",0);
addSaveVar("au",0);
addSaveVar("arenaPyramidCraftT",0);
addSaveVar("arenaMegabossCraftT",0);
addSaveVar("arenaCorruptionCraftT",0);
addSaveVar("arenaRevengeCraftT",0);
addSaveVar("arenaEndlessCraftT",0);
addSaveVar("seppukuTime",0);
addSaveVar("seppukuTotal",0);
addSaveVar("seppukuAscension",0);
addSaveVar("seppukuEnd",0);
addSaveVar("seppukuReward",0);
addSaveVar("seppukuPenalty",0);
addSaveVar("arenaUniqueStock",10);
addSaveVar("arenaChaosLeft",15);
addSaveVar("arenaChaosMax",15);
addSaveVar("arenaStorage2",false);
addSaveVar("arenaStorage3",false);
addSaveVar("arenaStorage4",false);
addSaveVar("shinyWeekCount",0);
addSaveVar("shinyWeekLast",24);
addSaveVar("shinyWeek2Count",0);
addSaveVar("shinyWeek2Last",10);
addSaveVar("tech1Program","Disabled");
addSaveVar("tech2Program","Disabled");
addSaveVar("tech3Program","Disabled");
addSaveVar("tech4Program","Disabled");
addSaveVar("tech5Program","Disabled");
addSaveVar("tech6Program","Disabled");
addSaveVar("tech7Program","Disabled");
addSaveVar("tech8Program","Disabled");
addSaveVar("tech9Program","Disabled");
addSaveVar("tech1Array",[false,false,false,false,false,false,false,false,false,false,false]);
addSaveVar("tech2Array",[false,false,false,false,false,false,false,false,false,false,false]);
addSaveVar("tech3Array",[false,false,false,false,false,false,false,false,false,false,false]);
addSaveVar("tech4Array",[false,false,false,false,false,false,false,false,false,false,false]);
addSaveVar("tech5Array",[false,false,false,false,false,false,false,false,false,false,false]);
addSaveVar("tech6Array",[false,false,false,false,false,false,false,false,false,false,false]);
addSaveVar("tech7Array",[false,false,false,false,false,false,false,false,false,false,false]);
addSaveVar("tech8Array",[false,false,false,false,false,false,false,false,false,false,false]);
addSaveVar("tech9Array",[false,false,false,false,false,false,false,false,false,false,false]);
addSaveVar("tech1StringA","");
addSaveVar("tech2StringA","");
addSaveVar("tech3StringA","");
addSaveVar("tech4StringA","");
addSaveVar("tech5StringA","");
addSaveVar("tech6StringA","");
addSaveVar("tech7StringA","");
addSaveVar("tech8StringA","");
addSaveVar("tech9StringA","");
addSaveVar("tech1StringB","");
addSaveVar("tech2StringB","");
addSaveVar("tech3StringB","");
addSaveVar("tech4StringB","");
addSaveVar("tech5StringB","");
addSaveVar("tech6StringB","");
addSaveVar("tech7StringB","");
addSaveVar("tech8StringB","");
addSaveVar("tech9StringB","");
addSaveVar("tech1NumberA",0);
addSaveVar("tech2NumberA",0);
addSaveVar("tech3NumberA",0);
addSaveVar("tech4NumberA",0);
addSaveVar("tech5NumberA",0);
addSaveVar("tech6NumberA",0);
addSaveVar("tech7NumberA",0);
addSaveVar("tech8NumberA",0);
addSaveVar("tech9NumberA",0);
addSaveVar("tech1NumberB",0);
addSaveVar("tech2NumberB",0);
addSaveVar("tech3NumberB",0);
addSaveVar("tech4NumberB",0);
addSaveVar("tech5NumberB",0);
addSaveVar("tech6NumberB",0);
addSaveVar("tech7NumberB",0);
addSaveVar("tech8NumberB",0);
addSaveVar("tech9NumberB",0);
addSaveVar("tech1NumberC",0);
addSaveVar("tech2NumberC",0);
addSaveVar("tech3NumberC",0);
addSaveVar("tech4NumberC",0);
addSaveVar("tech5NumberC",0);
addSaveVar("tech6NumberC",0);
addSaveVar("tech7NumberC",0);
addSaveVar("tech8NumberC",0);
addSaveVar("tech9NumberC",0);
addSaveVar("screenSelect",false);
addSaveVar("featureSelected",1);
addSaveVar("correctedFeature",13);
addSaveVar("businessDisplay",false);
addSaveVar("fighterMakerReward",false);
addSaveVar("arenaDisplayMonsterPercentage",false);
addSaveVar("displayName","????");
_root.newsCount = 0;
_root.newsID = new Array();
_root.newsFeature = new Array();
_root.newsSauceName = new Array();
addNewsType(0,0,0,0,"GENERAL");
addNewsType(1,0,4,16711680,"System messages (recommended)");
addNewsType(167,0,4,10092441,"EXP bar information");
addNewsType(163,0,3,16777215,"When I gain White Coins");
addNewsType(159,0,3,13434624,"Speedrun / Challenge Mode information");
addNewsType(2,0,3,16776960,"When I level up");
addNewsType(3,0,3,16776960,"When I earn an achievement");
addNewsType(155,0,3,13434879,"When I gain Event Tokens");
addNewsType(0,0,0,0,"PROGRESS BAR");
addNewsType(4,0,1,16768460,"When I claim a reward");
addNewsType(5,0,1,16768460,"When I claim multiple rewards");
addNewsType(6,0,1,16768460,"When I gain free Boost");
addNewsType(7,0,1,16768460,"When I gain additional login rewards");
addNewsType(8,0,1,16768460,"When Epic Skill \'Double Progress\' activates");
addNewsType(9,0,1,16768460,"When Epic Skill \'Boost Charger\' activates");
addNewsType(10,0,1,16768460,"When Epic Skill \'Coin Collector\' activates");
addNewsType(11,0,1,16768460,"When Epic Skill \'Battery Booster\' activates");
addNewsType(12,0,1,16768460,"When Epic Skill \'Fanatical Fisher\' activates");
addNewsType(13,0,1,16768460,"When Epic Skill \'Module Master\' activates");
addNewsType(184,0,1,16768460,"When Epic Skill \'Cyborg Charger\' activates");
addNewsType(15,0,2,16776960,"When I upgrade my Progress Bar Speed");
addNewsType(0,0,0,0,"FEATURE SHOP");
addNewsType(14,0,2,16776960,"When I buy a new feature");
addNewsType(0,0,0,0,"GARDEN");
addNewsType(18,6,2,10092441,"When I plant new trees");
addNewsType(19,6,3,10092441,"When I harvest my trees");
addNewsType(20,6,4,16711680,"When my trees expire");
addNewsType(21,6,2,10092441,"When I find Randomfruit");
addNewsType(22,6,2,10092441,"When I find seeds for Another Garden");
addNewsType(23,6,2,10092441,"When I use (Mega) Fertilizers");
addNewsType(172,6,2,10092441,"When I eat or sell Randomfruit");
addNewsType(24,6,2,16711680,"When I expand my Garden");
addNewsType(0,0,0,0,"BATTLE ARENA");
addNewsType(25,7,3,16776960,"When my Rank increases");
addNewsType(26,7,3,16776960,"When Robacon / Robroccoli\'s Rank increases");
addNewsType(27,7,1,16751001,"When a non-boss monster appears");
addNewsType(28,7,2,16751103,"When a boss monster appears");
addNewsType(29,7,2,16751001,"When a monster is defeated");
addNewsType(30,7,2,16751001,"When I receive Bestiary bonus");
addNewsType(31,7,2,16751001,"When I receive Invisible Ally bonus");
addNewsType(32,7,3,16776960,"When a Bestiary entry levels up");
addNewsType(33,7,2,13421772,"When my Invisible Ally gains EXP");
addNewsType(34,7,3,16776960,"When my Invisible Ally is mastered");
addNewsType(35,7,3,16776960,"When I tame an Invisible Ally");
addNewsType(36,7,2,16764057,"When I loot Superior Crafting Material");
addNewsType(37,7,2,16764057,"When I loot Unobtainium");
addNewsType(185,7,2,16777215,"When I loot Tukkonium");
addNewsType(38,7,2,16764057,"When I loot Enhancer Fragments");
addNewsType(39,7,2,16764057,"When I loot Chaotic Fragments of Chaos");
addNewsType(40,7,2,16764057,"When I loot To-be-Nerfed Gems");
addNewsType(41,7,2,16764057,"When I loot Bacon / Broccoli");
addNewsType(42,7,2,16764057,"When I loot Crystals of Rarity");
addNewsType(43,7,2,16764057,"When I loot Crystals of Ultimate Rarity");
addNewsType(181,7,2,16764057,"When I loot Regular Boost Potions");
addNewsType(182,7,2,16764057,"When I loot Mega Boost Potions");
addNewsType(44,7,3,16776960,"When I loot a new Ring");
addNewsType(45,7,2,16764057,"When I loot a Ring (replaced with Pixels)");
addNewsType(46,7,3,16776960,"When I loot a Recipe");
addNewsType(47,7,3,16776960,"When I loot a Skill Scroll or extra SP");
addNewsType(48,7,3,16776960,"When I loot a Skill Book");
addNewsType(49,7,3,14535680,"When I get a Weapon");
addNewsType(50,7,3,14535680,"When I get an Armor");
addNewsType(51,7,3,14535680,"When I get an Accessory");
addNewsType(52,7,3,14535680,"When I get an Enhancer");
addNewsType(53,7,3,14535680,"When I get a Potion");
addNewsType(54,7,3,14535680,"When I get an Outfit");
addNewsType(170,7,3,14535680,"When I get a Chip");
addNewsType(55,7,3,16711680,"When a Weapon is deleted due to full inventory");
addNewsType(56,7,3,16711680,"When an Armor is deleted due to full inventory");
addNewsType(57,7,3,16711680,"When an Accessory is deleted due to full inventory");
addNewsType(58,7,3,16711680,"When an Enhancer is deleted due to full inventory");
addNewsType(59,7,3,16711680,"When a Potion is deleted due to full inventory");
addNewsType(60,7,3,16711680,"When an Outfit is deleted due to full inventory");
addNewsType(171,7,3,16711680,"When a Chip is deleted due to full inventory");
addNewsType(61,7,2,13434624,"When I enhance an item");
addNewsType(62,7,2,13434624,"When my equipment levels up");
addNewsType(63,7,3,16711680,"When my equipment expires");
addNewsType(64,7,2,16776960,"When I purchase additional raid entries");
addNewsType(65,7,3,16711680,"When I get killed");
addNewsType(168,7,3,65535,"When I throw To-be-Nerfed Gems");
addNewsType(66,7,3,65535,"Other Battle Arena messages (recommended)");
addNewsType(0,0,0,0,"BUTTON MACHINE");
addNewsType(67,8,2,13421721,"When I get a Perfect click");
addNewsType(68,8,2,13421721,"When the button breaks");
addNewsType(69,8,3,16776960,"When I get an Explosion Crate from the Button");
addNewsType(70,8,3,16776960,"When I get an Awesome Crate from the Button");
addNewsType(71,8,3,16776960,"When I get a Chaos Crate from the Button");
addNewsType(72,8,3,16776960,"When I get a Legendary Box from the Button");
addNewsType(73,8,2,13421721,"When I repair the button");
addNewsType(74,8,2,16776960,"When I buy items from the Button Machine Shop");
addNewsType(0,0,0,0,"MONEY PRINTER");
addNewsType(75,9,2,16777164,"When some Coins are printed");
addNewsType(76,9,2,65280,"When some Green Coins are printed");
addNewsType(77,9,2,16776960,"When I upgrade the Money Printer");
addNewsType(156,9,3,16711680,"When Battery is low");
addNewsType(157,9,4,16711680,"When Battery runs out");
addNewsType(0,0,0,0,"ARCADE");
addNewsType(78,10,2,13421772,"[Pong] Hit");
addNewsType(79,10,2,15658734,"[Pong] Goal");
addNewsType(80,10,2,13421772,"[Avoidance] Avoided");
addNewsType(81,10,2,13421772,"[Math] Correct");
addNewsType(82,10,2,14540253,"[Math] Nice");
addNewsType(83,10,2,15658734,"[Math] Excellent");
addNewsType(84,10,2,13421772,"[Whack] Good");
addNewsType(85,10,2,14540253,"[Whack] Great");
addNewsType(86,10,2,15658734,"[Whack] Perfect");
addNewsType(87,10,2,15658734,"[Whack] Awesome");
addNewsType(89,10,2,15658734,"[Mind] Goal found");
addNewsType(90,10,2,13421772,"[Balance] Blocks destroyed");
addNewsType(91,10,2,14540253,"[Count] Stage cleared");
addNewsType(92,10,2,15658734,"[Count] Confidence bonus");
addNewsType(97,10,3,16777215,"Final result");
addNewsType(161,10,3,13382400,"When I gain Arcade 100k Medals");
addNewsType(98,10,2,16776960,"When I buy items from the Arcade shop");
addNewsType(0,0,0,0,"STADIUM");
addNewsType(99,11,2,10079487,"When I use items");
addNewsType(100,11,2,8961006,"When opponents use items");
addNewsType(101,11,3,13434879,"When I KO opponent in Death Match");
addNewsType(102,11,3,12316398,"When opponent KOs me in Death Match");
addNewsType(103,11,3,13434879,"Final result");
addNewsType(104,11,2,16776960,"When I buy items from the Stadium shop");
addNewsType(0,0,0,0,"TUKKUNFCG");
addNewsType(105,12,3,65535,"Final result");
addNewsType(106,12,3,16776960,"When my FCG Level increases");
addNewsType(0,0,0,0,"LOLMARKET");
addNewsType(107,13,1,16777113,"When prices change");
addNewsType(108,13,2,16777113,"When I purchase gems");
addNewsType(109,13,2,16777113,"When I sell gems");
addNewsType(110,13,3,16776960,"When LolMarket capacity increases");
addNewsType(0,0,0,0,"AWESOME ADVENTURES");
addNewsType(111,14,2,65535,"When I adventure");
addNewsType(112,14,3,65535,"When I gain Energy");
addNewsType(113,14,2,65535,"When my Reputation changes");
addNewsType(114,14,2,16776960,"When I buy items from the Awesome Shop");
addNewsType(0,0,0,0,"FISHING");
addNewsType(115,22,2,153,"When I fail to catch something");
addNewsType(116,22,2,3355596,"When I get a non-perfect catch");
addNewsType(117,22,2,6711039,"When I get a perfect catch");
addNewsType(162,22,3,13369599,"When I gain bonus LEGEND EXP");
addNewsType(118,22,2,10066431,"When I gain Mastery");
addNewsType(119,22,3,16776960,"When I open Treasure Boxes");
addNewsType(120,22,2,16776960,"When I raise Skill or Bucket Capacity");
addNewsType(0,0,0,0,"DRAGON OF WISDOM");
addNewsType(121,19,1,11184810,"When I feed the Dragon of Wisdom");
addNewsType(122,19,3,16776960,"When I receive Dragon Feeding Reward");
addNewsType(123,19,3,16776960,"When I claim Level Up Reward");
addNewsType(0,0,0,0,"MYSTERY BOXES");
addNewsType(124,17,1,10066329,"When I open empty Gambler\'s Boxes or get a refund");
addNewsType(164,17,3,13421568,"When I open Legendary Boxes");
addNewsType(165,17,3,13421568,"When I open Attendance Boxes");
addNewsType(166,17,3,13421568,"When I open Supply Crates");
addNewsType(125,17,2,16776960,"When I receive a Common prize");
addNewsType(126,17,3,15658496,"When I receive an Uncommon prize");
addNewsType(127,17,3,13421568,"When I receive a Rare prize");
addNewsType(183,17,3,13369599,"When I receive a Mega Boost Potion from Progress Boxes");
addNewsType(0,0,0,0,"CARDS");
addNewsType(128,18,2,14548736,"When I activate a Card");
addNewsType(129,18,4,16711680,"When a Card is deactivated");
addNewsType(130,18,2,14548736,"When I trade a Card for Supply Crates");
addNewsType(0,0,0,0,"CAREER");
addNewsType(131,0,2,39423,"When I gain \'Idler\' Career EXP");
addNewsType(132,6,2,39423,"When I gain \'Gardener\' Career EXP");
addNewsType(133,7,2,39423,"When I gain \'Fighter\' Career EXP");
addNewsType(134,7,2,39423,"When I gain \'Item Maker\' Career EXP");
addNewsType(135,8,2,39423,"When I gain \'Button Basher\' Career EXP");
addNewsType(136,10,2,39423,"When I gain \'Arcade Player\' Career EXP");
addNewsType(137,11,2,39423,"When I gain \'Racer\' Career EXP");
addNewsType(138,12,2,39423,"When I gain \'Card Player\' Career EXP");
addNewsType(139,13,2,39423,"When I gain \'Gem Trader\' Career EXP");
addNewsType(140,14,2,39423,"When I gain \'Adventurer\' Career EXP");
addNewsType(141,0,2,39423,"When I gain \'Pet Trainer\' Career EXP");
addNewsType(142,22,2,39423,"When I gain \'Fisher\' Career EXP");
addNewsType(143,0,1,39423,"When I receive Blessing Bonus");
addNewsType(144,0,3,16776960,"When a Career levels up");
addNewsType(145,0,4,16711680,"When a Career is deactivated");
addNewsType(158,0,4,16711680,"When a Career runs out of blessing time");
addNewsType(0,0,0,0,"PET");
addNewsType(146,0,2,16737792,"When my Pet gains Fullness");
addNewsType(147,0,2,16737792,"When my Pet gains Health");
addNewsType(148,0,2,16737792,"When my Pet gains Mana");
addNewsType(149,0,3,13382400,"When my Pet loses Fullness");
addNewsType(150,0,3,13382400,"When my Pet loses Health");
addNewsType(151,0,3,16711680,"When my Pet\'s Fullness is low");
addNewsType(152,0,4,16711680,"When my Pet\'s Health is low");
addNewsType(153,0,4,16711680,"When my Pet dies");
addNewsType(154,0,3,16776960,"When I use my Pet\'s Mad Skillz");
addNewsType(173,0,2,16711680,"Overfeeding warning");
addNewsType(0,0,0,0,"SIMULATION CYBORG");
addNewsType(174,0,3,12303359,"When you gain Cyborg Points");
addNewsType(175,0,3,12303359,"When Cyborg finishes an action");
addNewsType(176,0,4,16711680,"When Simulation Cyborg is paused");
addNewsType(177,0,4,16776960,"When Simulation Cyborg continues working");
addNewsType(178,0,4,16711680,"When Simulation Cyborg finishes working");
addNewsType(179,0,2,12303359,"When Simulation Cyborg gains EXP");
addNewsType(180,0,3,16776960,"When Simulation Cyborg levels up");
addNewsType(0,0,0,0,"TECHNICAL LIGHTS");
addNewsType(160,0,4,13421823,"Variable Tracking");
_root.selectT = 1;
_root.specialShopPage = 1;
_root.invTab = 0;
_root.stadiumBetCoin = 250000;
_root.stadiumBetToken = 0;
_root.fishPopPage = 0;
_root.invTab = 0;
_root.questScreenPage = 1;
_root.shopScreenPage = 1;
_root.achViewType = 2;
_root.achViewPage = 1;
_root.achMode = "All";
if(_root.saveid <= 3)
{
   if(_root.save.compatible == undefined || _root.save.compatible < 3)
   {
      _root.gotoAndStop(14);
   }
}
_root._quality = _root.saveGlobal.graphicQuality;
if(_root.save.newbieSet3 != true)
{
   _root.save.newbieSet3 = true;
   _root.getArenaWeapon(1,"Stick",101,false,30,13,0,10,0,0,1,0,1,0,0,0,"","","",0,Infinity,false,false,false,false,false,0,"Newbie Stick","A free weapon to help you with your adventures! It\'s just a stick, but it\'s better than nothing, right?");
   _root.getArenaArmor(1,"Hat",101,0,0,10,10,0,0,1,0,1,0,0,0,"","","",0,Infinity,false,false,false,false,false,0,"Newbie Hat","");
   _root.getArenaArmor(1,"Shirt",101,0,0,10,10,0,0,1,0,1,0,0,0,"","","",0,Infinity,false,false,false,false,false,0,"Newbie Shirt","");
   _root.getArenaArmor(1,"Gloves",101,0,0,10,10,0,0,1,0,1,0,0,0,"","","",0,Infinity,false,false,false,false,false,0,"Newbie Gloves","");
   _root.getArenaArmor(1,"Pants",101,0,0,10,10,0,0,1,0,1,0,0,0,"","","",0,Infinity,false,false,false,false,false,0,"Newbie Pants","");
   _root.getArenaArmor(1,"Shoes",101,0,0,10,10,0,0,1,0,1,0,0,0,"","","",0,Infinity,false,false,false,false,false,0,"Newbie Shoes","");
   _root.getArenaEnhancer("Weapon Attack Enhancer",3,15,0,100,"","","",0,150,0,Infinity,"Weapon Attack Rock Lv. 3","A free enhancer for you! To use an enhancer, just click it and then click the item you want to enhance! You cannot enhance items you are equipping, so unequip them first.");
}
waitTime = 0;
onEnterFrame = function()
{
   if(_root.upnumber >= _root.save.minVersion)
   {
      waitTime += 1;
   }
   else
   {
      _root.showPopup("Notice","Make sure you are playing on version " + _root.save.minVersion + " or later.");
   }
   if(waitTime > 5)
   {
      _root.nextFrame();
   }
};
