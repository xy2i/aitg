import re
import sys
from pathlib import Path


def parse_parameters(param_string):
    """Parse parameters handling nested parentheses and quotes."""
    params = []
    current_param = []
    in_quotes = False
    paren_count = 0

    for char in param_string:
        if char == '"':
            in_quotes = not in_quotes
            current_param.append(char)
        elif char == "(" and not in_quotes:
            paren_count += 1
            current_param.append(char)
        elif char == ")" and not in_quotes:
            paren_count -= 1
            current_param.append(char)
        elif char == "," and not in_quotes and paren_count == 0:
            params.append("".join(current_param).strip())
            current_param = []
        else:
            current_param.append(char)

    if current_param:
        params.append("".join(current_param).strip())

    return [p.strip().strip('"') for p in params]


def parse_weapon_line(line):
    # Extract parameters from between the outermost parentheses
    params_match = re.match(r"addArenaCraftWeapon\((.*)\);?$", line.strip())
    if not params_match:
        return None

    # Parse parameters handling nested parentheses
    params = parse_parameters(params_match.group(1))

    # Create parameter mapping
    param_names = [
        "recipeType",
        "recipeReq",
        "recipeLimit",
        "reqRank",
        "subtype",
        "range",
        "frame",
        "attack",
        "speed",
        "defense",
        "crit",
        "dexterity",
        "health",
        "maxLevel",
        "expTNL",
        "enhance",
        "bonusPow",
        "bonus",
        "ability",
        "moreBonus",
        "sell",
        "expiry",
        "noBonus",
        "noLife",
        "noFuse",
        "noUnique",
        "spirit",
        "unob",
        "costPixel",
        "costCraft",
        "costSpec",
        "careerExp",
        "name",
        "desc",
    ]

    weapon_data = dict(zip(param_names, params))

    # Transform RecipeType
    recipe_type_map = {
        "1": "RecipeType.Newbie",
        "3": "RecipeType.Basic",
        "4": "RecipeType.Lrn2Craft",
        "5": "RecipeType.Secret",
        "6": "RecipeType.Career",
        "7": "RecipeType.Kommander",
        "8": "RecipeType.Arena",
        "10": "RecipeType.Norris",
        "12": "RecipeType.Alien",
        "14": "RecipeType.EliteAlien",
        "15": "RecipeType.Chaotic",
        "16": "RecipeType.Unob",
        "17": "RecipeType.Enhancer",
        "18": "RecipeType.Bacon",
        "19": "RecipeType.Reinc",
        "21": "RecipeType.Tukk",
    }
    weapon_data["recipeType"] = recipe_type_map.get(
        weapon_data["recipeType"], weapon_data["recipeType"]
    )

    # Transform WeaponSubtype - handle subtypes with parentheses
    subtype = weapon_data["subtype"].replace("(", "_").replace(")", "_").strip("_")
    weapon_data["subtype"] = f"WeaponSubtype.{subtype}"

    # Handle boolean values
    for bool_field in ["range", "noBonus", "noLife", "noFuse", "noUnique", "spirit"]:
        weapon_data[bool_field] = str(weapon_data[bool_field]).lower()

    # Handle null/empty values
    for nullable_field in ["bonus", "ability", "moreBonus"]:
        if weapon_data[nullable_field] in ['""', ""]:
            weapon_data[nullable_field] = "null"

    # Handle infinity
    if weapon_data["expiry"] == "Infinity":
        weapon_data["expiry"] = "float.PositiveInfinity"

    if weapon_data["bonus"] != "null":
        weapon_data["bonus"] = f"GreenBonus.{weapon_data["bonus"].replace(" ", "")}"
    if weapon_data["ability"] != "null":
        weapon_data["ability"] = (
            f"OrangeBonus.{weapon_data["ability"].replace(" ", "")}"
        )
    if weapon_data["moreBonus"] != "null":
        weapon_data["moreBonus"] = (
            f"PurpleBonus.{weapon_data["moreBonus"].replace(" ", "")}"
        )

    # Create the new format
    new_format = """new Weapon {{ name = "{name}", recipeType = {recipeType}, recipeReq = {recipeReq}, recipeLimit = {recipeLimit}, reqRank = {reqRank}, frame = {frame}, enhance = {enhance}, sell = {sell}, bonusPow = {bonusPow}, expiry = {expiry}, costPixel = {costPixel}, costCraft = {costCraft}, costSpec = {costSpec}, careerExp = {careerExp}, desc = "{desc}", subtype = {subtype}, range = {range}, attack = {attack}, speed = {speed}, defense = {defense}, crit = {crit}, dexterity = {dexterity}, health = {health}, expTNL = {expTNL}, bonus = {bonus}, ability = {ability}, moreBonus = {moreBonus}, noBonus = {noBonus}, noLife = {noLife}, noFuse = {noFuse}, noUnique = {noUnique}, spirit = {spirit}, unob = {unob} }},""".format(
        **weapon_data
    )

    return new_format


def process_file(input_path, output_path):
    try:
        # Read input file
        with open(input_path, "r", encoding="utf-8") as infile:
            lines = infile.readlines()

        # Process each line
        processed_weapons = []
        for line in lines:
            line = line.strip()
            if line.startswith("addArenaCraftWeapon"):
                processed = parse_weapon_line(line)
                if processed:
                    processed_weapons.append(processed)

        # Write output file
        with open(output_path, "w", encoding="utf-8") as outfile:
            outfile.write("public static readonly Weapon[] weapons = {\n")
            outfile.write("\n".join(processed_weapons))
            # Remove the trailing comma from the last item and close the array
            outfile.seek(outfile.tell() - 1)  # Remove last comma
            outfile.write("\n};")

        print(f"Successfully processed {len(processed_weapons)} weapons")
        print(f"Output written to: {output_path}")

    except Exception as e:
        print(f"Error processing files: {str(e)}", file=sys.stderr)
        sys.exit(1)


def main():
    if len(sys.argv) != 3:
        print("Usage: python script.py input_file output_file")
        sys.exit(1)

    input_path = Path(sys.argv[1])
    output_path = Path(sys.argv[2])

    if not input_path.exists():
        print(f"Error: Input file {input_path} does not exist", file=sys.stderr)
        sys.exit(1)

    process_file(input_path, output_path)


if __name__ == "__main__":
    main()
