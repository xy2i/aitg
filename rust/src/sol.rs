//! SOL format parser.
//!
//! Anti-Idle uses the AMF0 format.
//! See https://download.macromedia.com/pub/labs/amf/amf0_spec_121207.pdf.
//! Also see https://github.com/sile/amf for an implementation.
use std::collections::HashMap;

use indexmap::IndexMap;

#[derive(Debug, Clone)]
pub enum Amf0Value {
    Number(f64),
    Boolean(bool),
    String(String),
    Null,
    Undefined,
    EcmaArray(IndexMap<usize, Amf0Value>),
}

#[derive(Debug)]
pub struct Savedata {
    pub name: String,
    pub data: HashMap<String, Amf0Value>,
}

const END_OF_OBJECT: [u8; 3] = [0x00, 0x00, 0x09];

struct Parser<'a> {
    data: &'a [u8],
    pos: usize,
}

impl<'a> Parser<'a> {
    fn new(data: &'a [u8]) -> Self {
        Self { data, pos: 0 }
    }

    fn read_bytes(&mut self, len: usize) -> &[u8] {
        if self.pos + len > self.data.len() {
            panic!("unexpected end of data");
        }
        let bytes = &self.data[self.pos..self.pos + len];
        self.pos += len;
        bytes
    }

    fn has_remaining_data(&self) -> bool {
        self.pos < self.data.len()
    }

    fn read_u8(&mut self) -> u8 {
        self.read_bytes(1)[0]
    }

    fn read_u16(&mut self) -> u16 {
        u16::from_be_bytes(self.read_bytes(2).try_into().unwrap())
    }

    fn read_u32(&mut self) -> u32 {
        u32::from_be_bytes(self.read_bytes(4).try_into().unwrap())
    }

    fn read_f64(&mut self) -> f64 {
        f64::from_be_bytes(self.read_bytes(8).try_into().unwrap())
    }

    fn read_bool(&mut self) -> bool {
        self.read_u8() != 0
    }

    fn read_str(&mut self) -> String {
        let len = self.read_u16();
        let bytes = self.read_bytes(len as usize);
        String::from_utf8(bytes.to_vec()).expect("invalid utf-8 in decoded string")
    }

    fn check_end_of_object(&mut self) -> bool {
        self.data[self.pos..self.pos + 3] == END_OF_OBJECT
    }

    fn read_end_of_object(&mut self) -> bool {
        self.read_bytes(3) == END_OF_OBJECT
    }

    fn read_key_value_pair(&mut self) -> (String, Amf0Value) {
        (self.read_str(), self.read_amf0_value())
    }

    fn read_ecma_array(&mut self) -> IndexMap<usize, Amf0Value> {
        // Skip array length
        self.read_u32();

        let mut map = IndexMap::new();
        while !self.check_end_of_object() {
            let (key, value) = self.read_key_value_pair();
            let key = key.parse::<usize>().unwrap();
            map.insert(key, value);
        }

        assert!(self.read_end_of_object());

        map
    }

    fn read_amf0_value(&mut self) -> Amf0Value {
        let tag = self.read_u8();
        match tag {
            0x0 => Amf0Value::Number(self.read_f64()),
            0x1 => Amf0Value::Boolean(self.read_bool()),
            0x2 => Amf0Value::String(self.read_str()),
            0x5 => Amf0Value::Null,
            0x6 => Amf0Value::Undefined,
            0x8 => Amf0Value::EcmaArray(self.read_ecma_array()),
            _ => panic!("unexpected tag {tag}"),
        }
    }

    fn read_header(&mut self) -> String {
        // Skip magic marker (00 BF)
        let magic = self.read_bytes(2);
        if magic != [0x00, 0xBF] {
            panic!("Invalid SOL file: wrong magic bytes");
        }

        // Length
        self.read_u32();

        // Validate TCSO magic
        if self.read_bytes(4) != b"TCSO" {
            panic!("Invalid SOL file: corrupted magic");
        }

        // Skip unknown 6 bytes
        self.read_bytes(6);

        // Read SOL name
        let sol_name = self.read_str();

        // Check version (must be 0 for AMF0)
        let version = self.read_u32();
        if version != 0 {
            panic!("Invalid SOL file: AMF0 expected, AMF3 found")
        }

        sol_name
    }
}

pub fn read_sol(data: &[u8]) -> Savedata {
    let mut parser = Parser::new(data);
    let name = parser.read_header();
    println!("Reading save from SOL, internal name: {}", name);

    let mut save = Savedata {
        name,
        data: HashMap::new(),
    };

    while parser.has_remaining_data() {
        let (key, value) = parser.read_key_value_pair();
        dbg!(&key, &value);
        save.data.insert(key, value);

        // Check trailing byte (must be 0x00)
        let trailing = parser.read_u8();
        if trailing != 0 {
            panic!("Invalid trailing byte: must be 0, got {trailing}");
        }
        dbg!(parser.pos);
    }

    save
}

#[cfg(test)]
mod test {
    use super::*;
    use std::fs::read;

    #[test]
    pub fn atg_global() {
        let file = read("tests/sol/ATG_Global.sol").unwrap();
        let save = read_sol(&file);
    }
}
