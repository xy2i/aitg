// //! Deserialization from the SOL format.
use super::parse::Amf0Value;

// A trait for deserializing types from Amf0Value.
pub trait Deserialize: Sized {
    fn deserialize(value: &[u8]) -> Self;
}

pub struct Visitor;

impl Visitor {
    pub fn visit_f64(value: &Amf0Value) -> f64 {
        match value {
            Amf0Value::Number(num) => *num,
            _ => panic!("Expected number, got {value:?}"),
        }
    }
    pub fn visit_string(value: &Amf0Value) -> String {
        match value {
            Amf0Value::String(string) => string.clone(),
            _ => panic!("Expected string, got {value:?}"),
        }
    }
}

// // Implementations for primitive types
// impl Deserialize for f64 {
//     fn deserialize(value: &[u8]) -> Self {
//     }
// }

// impl Deserialize for bool {
//     fn deserialize(value: Amf0Value) -> Self {
//         match value {
//             Amf0Value::Boolean(bool) => bool,
//             _ => panic!("Expected bool, got {value:?}"),
//         }
//     }
// }

// impl Deserialize for String {
//     fn deserialize(value: Amf0Value) -> Self {
//         match value {
//             Amf0Value::String(string) => string,
//             _ => panic!("Expected str, got {value:?}"),
//         }
//     }
// }

// impl Deserialize for SparseArray<f64> {
//     fn deserialize(value: Amf0Value) -> SparseArray<f64> {
//         let Amf0Value::EcmaArray(array) = value else {
//             panic!("Expected ECMAarray, got {value:?}");
//         };

//         let transformed = array.into_iter().map(|(key, value)| match value {
//             Amf0Value::Number(value) => (key, value),
//             Amf0Value::Undefined => (key, f64::default()),
//             _ => panic!(
//                 "Tried to convert ECMAarray to string array, but got {value:?} at position {key:?}"
//             ),
//         });

//         let mut array = SparseArray::new();
//         for (key, value) in transformed {
//             array.insert(key, value);
//         }

//         array
//     }
// }

// impl Deserialize for SparseArray<String> {
//     fn deserialize(value: Amf0Value) -> SparseArray<String> {
//         let Amf0Value::EcmaArray(array) = value else {
//             panic!("Expected ECMAarray, got {value:?}");
//         };

//         let transformed = array.into_iter().map(|(key, value)| match value {
//             Amf0Value::String(value) => (key, value),
//             Amf0Value::Undefined => (key, String::default()),
//             _ => panic!(
//                 "Tried to convert ECMAarray to string array, but got {value:?} at position {key:?}"
//             ),
//         });

//         let mut array = SparseArray::new();
//         for (key, value) in transformed {
//             array.insert(key, value);
//         }

//         array
//     }
// }
