//! status=pending
function addFish(fishCate, fishLevel, fishSpeed, fishSpec, fishFatigue, fishExp, fishAExp, fullness, fatigueRestore, coin, material)
{
   var _loc1_ = new Object();
   _loc1_.fishCate = fishCate;
   _loc1_.fishLevel = fishLevel;
   _loc1_.fishSpeed = fishSpeed;
   _loc1_.fishSpec = fishSpec;
   _loc1_.fishFatigue = fishFatigue;
   _loc1_.fishExp = fishExp;
   _loc1_.fishAExp = fishAExp;
   _loc1_.fullness = fullness;
   _loc1_.fatigue = fatigueRestore;
   _loc1_.coin = coin;
   _loc1_.material = material;
   fishArray.push(_loc1_);
}
fishArray = [zeroItem];
addFish("Treasure","Bronze",10,"Manual+",600,600,60000,0,0,100000,100000);
addFish("Treasure","Silver",10,"Manual+",600,900,90000,0,0,500000,500000);
addFish("Treasure","Golden",10,"Manual+",600,1200,120000,0,0,2000000,2000000);
addFish("Key","Bronze",10,"Manual",300,300,30000,0,0,50000,50000);
addFish("Key","Silver",10,"Manual",300,450,45000,0,0,250000,250000);
addFish("Key","Golden",10,"Manual",300,600,60000,0,0,1000000,1000000);
addFish("Energy Drink","Regular",20,"Manual",200,200,20000,0,500,125000,0);
addFish("Energy Drink","Elite",20,"Manual+",200,300,30000,0,750,500000,0);
addFish("Pet Food","Regular",20,"Manual",200,200,20000,20,0,125000,0);
addFish("Pet Food","Elite",20,"Manual+",200,300,30000,30,0,500000,0);
addFish("Junk",1,30,"",40,22,2000,0,0,0,5000);
addFish("Junk",2,30,"",40,24,2100,0,0,0,10000);
addFish("Junk",3,30,"",40,26,2200,0,0,0,15000);
addFish("Junk",4,30,"",40,28,2300,0,0,0,20000);
addFish("Junk",5,30,"",40,30,2400,0,0,0,25000);
addFish("Junk",6,30,"",40,32,2500,0,0,0,30000);
addFish("Junk",7,30,"",40,34,2600,0,0,0,35000);
addFish("Junk",8,30,"",40,36,2700,0,0,5000,40000);
addFish("Junk",9,30,"",48,42,3360,0,0,15000,45000);
addFish("Junk",10,30,"",48,44,3480,0,0,25000,50000);
addFish("Junk",12,30,"",48,46,3600,0,0,35000,70000);
addFish("Junk",14,30,"",56,54,4340,0,0,45000,90000);
addFish("Junk",16,30,"",56,56,4480,0,0,55000,110000);
addFish("Junk",18,30,"",56,58,4620,0,0,65000,130000);
addFish("Junk",20,30,"",64,68,5440,0,0,75000,150000);
addFish("Junk",22,30,"",64,70,5600,0,0,100000,200000);
addFish("Junk",24,30,"",64,72,5760,0,0,125000,250000);
addFish("Junk",26,30,"",72,84,6660,0,0,150000,300000);
addFish("Junk",28,30,"",72,86,6840,0,0,175000,350000);
addFish("Junk",30,30,"",80,100,7800,0,0,200000,400000);
addFish("Fish",1,40,"",60,44,4000,0,2,5000,0);
addFish("Fish",2,40,"",60,48,4200,0,3,10000,0);
addFish("Fish",3,40,"",60,52,4400,0,4,15000,0);
addFish("Fish",4,40,"",60,56,4600,0,5,20000,0);
addFish("Fish",5,40,"",60,60,4800,0,6,25000,0);
addFish("Fish",6,40,"",60,64,5000,0,7,30000,0);
addFish("Fish",7,40,"",60,68,5200,0,8,35000,0);
addFish("Fish",8,40,"",60,72,5400,1,9,40000,0);
addFish("Fish",9,40,"",72,84,6720,1,10,45000,0);
addFish("Fish",10,40,"",72,88,6960,1,11,50000,0);
addFish("Fish",12,40,"",72,92,7200,1,12,70000,0);
addFish("Fish",14,40,"",84,108,8680,1,13,90000,0);
addFish("Fish",16,40,"",84,112,8960,1,14,110000,0);
addFish("Fish",18,40,"",84,116,9240,1,15,130000,0);
addFish("Fish",20,40,"",96,136,10880,1,16,150000,0);
addFish("Fish",22,40,"",96,140,11200,1,17,200000,0);
addFish("Fish",24,40,"",96,144,11520,1,18,250000,0);
addFish("Fish",26,40,"",108,168,13320,1,19,300000,0);
addFish("Fish",28,40,"",108,172,13680,1,20,350000,0);
addFish("Fish",30,40,"",120,200,15600,2,40,400000,0);
addFish("","",20,"",0,0,0,0,0,0,0);
addFish("Energy Refill","",20,"Manual",120,240,24000,0,0,0,0);
addFish("Fertilizer","",20,"Manual",150,300,30000,0,0,0,0);
addFish("Mega Fertilizer","",20,"Manual+",180,360,36000,0,0,0,0);
addFish("Explosion Crate","",20,"Manual",200,400,40000,0,0,0,0);
addFish("Awesome Crate","",20,"Manual",250,500,50000,0,0,0,0);
addFish("Chaos Crate","",20,"Manual",300,600,60000,0,0,0,0);
addFish("Legendary Box","",20,"Manual+",350,700,70000,0,0,0,0);
addFish("White Coin","",20,"Manual",100,200,20000,0,0,0,0);
addFish("Boost Potion","",20,"Manual",150,300,30000,0,0,0,0);
addFish("Mega Boost Potion","",20,"Manual+",200,400,40000,0,0,0,0);
addFish("","",20,"",0,0,0,0,0,0,0);
addFish("","",20,"",0,0,0,0,0,0,0);
addFish("","",20,"",0,0,0,0,0,0,0);
addFish("","",20,"",0,0,0,0,0,0,0);
addFish("","",20,"",0,0,0,0,0,0,0);
addFish("","",20,"",0,0,0,0,0,0,0);
addFish("","",20,"",0,0,0,0,0,0,0);
addFish("","",20,"",0,0,0,0,0,0,0);
addFish("","",20,"",0,0,0,0,0,0,0);
addFish("Fish",33,40,"",132,232,18000,3,60,500000,0);
addFish("Fish",36,40,"",144,268,20000,4,80,600000,0);
addFish("Fish",39,40,"",156,308,22500,5,100,700000,0);
addFish("Fish",42,40,"",168,352,25000,6,120,800000,0);
addFish("Fish",45,40,"",180,400,27500,7,140,900000,0);
addFish("Fish",48,40,"",192,452,30000,8,160,1000000,0);
addFish("Fish",51,40,"",216,568,35000,10,200,1250000,0);
addFish("Fish",54,40,"",240,700,40000,12,240,1500000,0);
addFish("Fish",57,40,"",360,1100,60000,15,300,2250000,0);
addFish("Fish",60,40,"",480,1500,80000,20,400,3000000,0);