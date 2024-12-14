//! SOL format parser.
//!
//! Anti-Idle uses the AMF0 format.
//! See https://download.macromedia.com/pub/labs/amf/amf0_spec_121207.pdf.
//! Also see https://github.com/sile/amf for an implementation.
pub mod de;
pub mod parse;
pub use de::Deserialize;

use aitg_proc::MyDeserialize;
use smart_default::SmartDefault;

#[derive(Debug, MyDeserialize, SmartDefault)]
#[allow(non_snake_case)]
pub struct Save {
    #[default = "????"]
    pub displayName: String,
    #[default = "Welcome to Anti-Idle!"]
    pub userTitle: String,
    pub bgred: f64,
}

#[cfg(test)]
mod tests {
    use de::Deserialize;

    use super::*;
    use std::fs::read;

    #[test]
    pub fn de() {
        let file = read("tests/sol/karlie_save.sol").unwrap();
        let save = Save::deserialize(&file);
        println!("from file:");
        println!("{save:?}");
        println!("default (no file):");
        let save = Save::default();
        println!("{save:?}");
    }
}
