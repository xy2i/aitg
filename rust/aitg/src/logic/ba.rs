//! Battle Arena.

#[derive(Debug)]
#[allow(non_snake_case)]
pub struct ArenaCraftWeapon {
    /// Item name
    pub name: &'static str,
    /// Item description
    pub desc: &'static str,
    /// Type of the recipe.
    pub recipeType: RecipeType,
    /// Recipe level requirement to unlock the item. 1 is always unlocked.
    pub recipeReq: f64,
    /// TODO: ???
    pub recipeLimit: f64,
    /// Minimum rank to equip/use.
    pub reqRank: f64,
    /// Associated graphic
    pub frame: f64,
    /// Enhance count
    pub enhance: f64,
    /// Color of the item in the inventory
    pub bonusPow: f64,
    /// Sell value.
    pub sell: f64,
    /// Expiry time. Equal to Infinity if item doesn't expire.
    pub expiry: f64,
    /// Cost in pixels.
    pub costPixel: f64,
    /// Cost in CM.
    pub costCraft: f64,
    /// Cost in the "special" currency, depends on recipe type.
    pub costSpec: f64,
    /// Career EXP gained from crafting.
    pub careerExp: f64,
    /// Is weapon range?
    pub range: bool,
    pub attack: f64,
    pub speed: f64,
    pub defense: f64,
    pub crit: f64,
    pub dexterity: f64,
    pub health: f64,
    /// Exp to next level
    pub expTNL: f64,
    /// Green bonus
    pub bonus: &'static str,
    /// Orange bonus
    pub moreBonus: &'static str,
    /// Purple bonus
    pub ability: &'static str,
    /// Can not apply Bonus rocks?
    pub noBonus: bool,
    /// TODO: ???
    pub noLife: bool,
    /// Not fusable?
    pub noFuse: bool,
    /// Not uniqueable?
    pub noUnique: bool,
    pub spirit: bool,
    /// Bonus tiers
    pub unob: f64,
    /// Weapon subtype
    pub subtype: WeaponSubtype,
}

#[derive(Debug)]
pub enum WeaponSubtype {
    Dagger,
    Sword,
    Spear,
    Axe,
    Hammer,
    Trophy,
    Stick,
    Gun,
    Bow,
    Claw,
    Crossbow,
    PolearmStab,
    Polearm,
    Wand,
    Slingshot,
    Cannon,
    Staff,
    MiningTool,
    SecondaryWeapon,
}

/// What kind of recipe is this? Defines the currency to buy with.
#[derive(Debug)]
pub enum RecipeType {
    /// Also used for items with no particular recipe, like chips.
    Newbie = 1,
    Basic = 3,
    Lrn2Craft = 4,
    Secret = 5,
    Career = 6,
    Kommander = 7,
    Arena = 8,
    Norris = 10,
    Alien = 12,
    EliteAlien = 14,
    Chaotic = 15,
    Unob = 16,
    Enhancer = 17,
    Bacon = 18,
    Reinc = 19,
    Tukk = 21,
}
