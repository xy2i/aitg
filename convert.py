import re
import sys

# Mappings for recipeType numbers to RecipeType enum variants
RECIPE_TYPE_MAP = {
    1: "RecipeType::Newbie",
    3: "RecipeType::Basic",
    4: "RecipeType::Lrn2Craft",
    5: "RecipeType::Secret",
    6: "RecipeType::Career",
    7: "RecipeType::Kommander",
    8: "RecipeType::Arena",
    10: "RecipeType::Norris",
    12: "RecipeType::Alien",
    14: "RecipeType::EliteAlien",
    15: "RecipeType::Chaotic",
    16: "RecipeType::Unob",
    17: "RecipeType::Enhancer",
    18: "RecipeType::Bacon",
    19: "RecipeType::Reinc",
    21: "RecipeType::Tukk",
}

# Mappings for subtype strings to WeaponSubtype enum variants
SUBTYPE_MAP = {
    "Dagger": "WeaponSubtype::Dagger",
    "Sword": "WeaponSubtype::Sword",
    "Spear": "WeaponSubtype::Spear",
    "Axe": "WeaponSubtype::Axe",
    "Hammer": "WeaponSubtype::Hammer",
    "Trophy": "WeaponSubtype::Trophy",
    "Stick": "WeaponSubtype::Stick",
    "Gun": "WeaponSubtype::Gun",
    "Bow": "WeaponSubtype::Bow",
    "Claw": "WeaponSubtype::Claw",
    "Crossbow": "WeaponSubtype::Crossbow",
    "Polearm (Stab)": "WeaponSubtype::PolearmStab",
    "Polearm": "WeaponSubtype::Polearm",
    "Wand": "WeaponSubtype::Wand",
    "Slingshot": "WeaponSubtype::Slingshot",
    "Cannon": "WeaponSubtype::Cannon",
    "Staff": "WeaponSubtype::Staff",
    "Mining Tool": "WeaponSubtype::MiningTool",
    "Secondary Weapon": "WeaponSubtype::SecondaryWeapon",
}

# Regex to extract arguments from addArenaCraftWeapon(...) calls
# This expects a line like:
# addArenaCraftWeapon(8,3,3,120,"Trophy",false,193,937,25,100,20,20,0,60,25000000,10,100,"Random","Random","",0,30,false,true,true,false,false,5,0,0,100,100,"Bronze Endurance Trophy","");
pattern = re.compile(r"addArenaCraftWeapon\((.*)\);")

for line in sys.stdin:
    line = line.strip()
    if not line.startswith("addArenaCraftWeapon("):
        continue

    m = pattern.search(line)
    if not m:
        continue

    args_str = m.group(1)

    # Split arguments by commas, taking into account quotes
    # A simplistic approach: split by commas not inside quotes.
    # For more robust parsing, use a CSV or argument parser that handles quotes.
    # This should work for well-formed input.
    parts = []
    current = []
    in_quotes = False
    for char in args_str:
        if char == '"':
            in_quotes = not in_quotes
            current.append(char)
        elif char == "," and not in_quotes:
            parts.append("".join(current).strip())
            current = []
        else:
            current.append(char)
    if current:
        parts.append("".join(current).strip())

    # Now parts is a list of all arguments as strings
    # Map them in order according to the function signature:
    # addArenaCraftWeapon(recipeType, recipeReq, recipeLimit, reqRank, subtype, range, frame, attack, speed, defense, crit, dexterity, health, maxLevel, expTNL, enhance, bonusPow, bonus, ability, moreBonus, sell, expiry, noBonus, noLife, noFuse, noUnique, spirit, unob, costPixel, costCraft, costSpec, careerExp, name, desc)

    (
        recipeType_str,
        recipeReq_str,
        recipeLimit_str,
        reqRank_str,
        subtype_str,
        range_str,
        frame_str,
        attack_str,
        speed_str,
        defense_str,
        crit_str,
        dexterity_str,
        health_str,
        maxLevel_str,
        expTNL_str,
        enhance_str,
        bonusPow_str,
        bonus_str,
        ability_str,
        moreBonus_str,
        sell_str,
        expiry_str,
        noBonus_str,
        noLife_str,
        noFuse_str,
        noUnique_str,
        spirit_str,
        unob_str,
        costPixel_str,
        costCraft_str,
        costSpec_str,
        careerExp_str,
        name_str,
        desc_str,
    ) = parts

    # Convert strings to appropriate Rust types
    def to_bool(s):
        return "true" if s.lower() == "true" else "false"

    def to_float(s):
        # If empty or not numeric, default to 0.
        # Adjust if needed.
        if s.strip() == "":
            return "0"
        # Remove quotes if any
        s = s.replace('"', "")
        try:
            float(s)
            return s
        except:
            return "0"

    def to_string(s):
        # Remove quotes
        s = s.strip()
        if s.startswith('"') and s.endswith('"'):
            s = s[1:-1]
        return s

    # Handle recipeType
    recipeType_val = int(recipeType_str)
    recipeType_enum = RECIPE_TYPE_MAP.get(
        recipeType_val, f"/* Unknown {recipeType_val} */ RecipeType::Unk"
    )

    # Handle subtype
    subtype_str_clean = to_string(subtype_str)
    subtype_enum = SUBTYPE_MAP.get(
        subtype_str_clean, "WeaponSubtype::Unk"
    )  # default if unknown

    # Convert booleans
    range_val = to_bool(range_str)
    noBonus_val = to_bool(noBonus_str)
    noLife_val = to_bool(noLife_str)
    noFuse_val = to_bool(noFuse_str)
    noUnique_val = to_bool(noUnique_str)
    spirit_val = to_bool(spirit_str)

    # Convert numeric
    recipeReq_val = to_float(recipeReq_str)
    recipeLimit_val = to_float(recipeLimit_str)
    reqRank_val = to_float(reqRank_str)
    frame_val = to_float(frame_str)
    attack_val = to_float(attack_str)
    speed_val = to_float(speed_str)
    defense_val = to_float(defense_str)
    crit_val = to_float(crit_str)
    dexterity_val = to_float(dexterity_str)
    health_val = to_float(health_str)
    maxLevel_val = to_float(maxLevel_str)
    expTNL_val = to_float(expTNL_str)
    enhance_val = to_float(enhance_str)
    bonusPow_val = to_float(
        bonusPow_str
    )  # Might need special handling if it's not numeric
    sell_val = to_float(sell_str)
    expiry_val = to_float(expiry_str)
    unob_val = to_float(unob_str)
    costPixel_val = to_float(costPixel_str)
    costCraft_val = to_float(costCraft_str)
    costSpec_val = to_float(costSpec_str)
    careerExp_val = to_float(careerExp_str)

    # Strings
    bonus_val = to_string(bonus_str)
    ability_val = to_string(ability_str)
    moreBonus_val = to_string(moreBonus_str)
    name_val = to_string(name_str)
    desc_val = to_string(desc_str)

    # Handle expiry according to the given logic:
    # if noLife == false then expiry = Infinity else expiry * 86400000
    # Careful: The code snippet given sets expiry = Infinity if noLife == false, opposite of what it said?
    # Original code: if(noLife == false) { _loc1_.expiry = Infinity; }
    # That means if noLife is false -> infinite expiry.
    # If noLife is true -> expiry * 86400000
    # Let's follow that logic:
    if noLife_val == "false":
        expiry_str_final = "f64::INFINITY"
    else:
        # Multiply by 86400000
        try:
            exp_val_num = float(expiry_val)
            exp_val_num *= 86400000.0
        except:
            exp_val_num = 0.0
        expiry_str_final = str(exp_val_num)[:-2]

    # If bonusPow is actually a numeric field, we keep it as is, else map it:
    # The final example shows bonusPow: BonusPow::Rainbow. If you have a mapping, add here.
    # If bonusPow is actually a string like "Random", we might need a mapping.
    # For now, if it's not numeric, let's just wrap in quotes.
    try:
        float(bonusPow_val)
        # It's numeric
        bonusPow_final = bonusPow_val
    except:
        bonusPow_final = f"/* TODO: Map {bonusPow_str} */ 0.0"

    # Print the output
    # Note: Adjust fields and formatting as needed.
    # Insert commas after each field line.
    print("ArenaCraftWeapon {")
    print(f'    name: "{name_val}",')
    print(f"    recipeType: {recipeType_enum},")
    print(f"    recipeReq: {recipeReq_val},")
    print(f"    recipeLimit: {recipeLimit_val},")
    print(f"    reqRank: {reqRank_val},")
    print(f"    frame: {frame_val},")
    print(f"    enhance: {enhance_val},")
    print(f"    sell: {sell_val},")
    print(f"    bonusPow: {bonusPow_final},")
    print(f"    expiry: {expiry_str_final},")
    print(f"    costPixel: {costPixel_val},")
    print(f"    costCraft: {costCraft_val},")
    print(f"    costSpec: {costSpec_val},")
    print(f"    careerExp: {careerExp_val},")
    print(f'    desc: "{desc_val}",')
    print(f"    subtype: {subtype_enum},")
    print(f"    range: {range_val},")
    print(f"    attack: {attack_val},")
    print(f"    speed: {speed_val},")
    print(f"    defense: {defense_val},")
    print(f"    crit: {crit_val},")
    print(f"    dexterity: {dexterity_val},")
    print(f"    health: {health_val},")
    print(f"    expTNL: {expTNL_val},")
    print(f'    bonus: "{bonus_val}",')
    print(f'    moreBonus: "{moreBonus_val}",')
    print(f'    ability: "{ability_val}",')
    print(f"    noBonus: {noBonus_val},")
    print(f"    noLife: {noLife_val},")
    print(f"    noFuse: {noFuse_val},")
    print(f"    noUnique: {noUnique_val},")
    print(f"    spirit: {spirit_val},")
    print(f"    unob: {unob_val},")
    print("},")
