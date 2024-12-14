use crate::save::Deserialize;
use crate::save::Save;
use godot::classes::file_access::ModeFlags;
use godot::{
    classes::{ILabel, Label},
    prelude::*,
};
use std::io::Read;

#[derive(GodotClass)]
#[class(base=Label)]
struct SaveLabel {
    base: Base<Label>,
    s: String,
}

#[godot_api]
impl ILabel for SaveLabel {
    fn init(base: Base<Label>) -> Self {
        let mut file = GFile::open("user://karlie_save.sol", ModeFlags::READ);

        let save = if file.is_err() {
            Save::default()
        } else {
            let mut buf = vec![];
            let _ = file.unwrap().read_to_end(&mut buf).unwrap();
            Save::deserialize(&buf)
        };

        godot_print!("{save:?}");
        Self {
            base,
            s: String::from(save.displayName),
        }
    }

    fn process(&mut self, delta: f64) {
        let s = self.s.clone();
        let mut base = self.base_mut();
        base.set_text(&s);
    }
}
