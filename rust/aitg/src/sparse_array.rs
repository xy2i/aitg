//! An array with holes.
//!
//! We need this since Rust doesn't have a "sparse array" or
//! "associative array". This is for AS2 compatibility.
//!
//! TODO: add usage examples here

use std::collections::HashMap;

/// An array with holes. Also known as "sparse array" or "associative array".
// I didn't implement all the HashMap methods. If there's one you want, check
// the documentation for HashMap [1] and you can add it in the `impl` block.
#[derive(Debug)]
pub struct SparseArray<T: Default> {
    base: HashMap<usize, T>,
}

/// Create a sparse array directly.
///
/// Creating a new empty sparse array:
///
/// ```rs
/// let a = sparse![];
/// assert_eq!(a.len(), 0);
/// ```
///
/// Creating a sparse array from some values:
/// ```rs
/// let a = sparse![10, 20, 30];
/// assert_eq!(a[1], 20);
/// ```
#[macro_export]
macro_rules! sparse {
    // Match an empty array: sparse![]
    () => {
        SparseArray::new()
    };

    // Non-empty case. We use a secondary matcher to handle the conversion
    ($($value:tt),+ $(,)?) => {
        SparseArray::from_values([
            $(
                sparse!(@as_expr $value)
            ),*
        ])
    };

    // If the token is a literal (which includes string literals and int    ), convert it.
    (@as_expr $x:literal) => {
        $x.into()
    };

    // For any other expression type (e.g. integers, variables), use them as-is.
    (@as_expr $x:expr) => {
        $x
    };
}

impl<T: Default> SparseArray<T> {
    /// Creates a new SparseArray.
    pub fn new() -> Self {
        Self {
            base: HashMap::new(),
        }
    }

    /// Creates a new SparseArray from some values.
    pub fn from_values<I>(iter: I) -> Self
    where
        I: IntoIterator<Item = T>,
    {
        let inner = iter.into_iter().enumerate().collect::<HashMap<usize, T>>();

        Self { base: inner }
    }

    /// Return a reference to the value stored for key,
    /// if it is present, else None.
    pub fn get(&self, key: usize) -> Option<&T> {
        self.base.get(&key)
    }

    /// Return a mutable reference to the value stored for key,
    /// if it is present, else None.
    pub fn get_mut(&mut self, key: usize) -> Option<&mut T> {
        self.base.get_mut(&key)
    }

    /// Inserts a key-value pair into the map.
    ///
    /// If the map did not have this key present, [`None`] is returned.
    ///
    /// If the map did have this key present, the value is updated, and the old
    /// value is returned. The key is not updated, though; this matters for
    /// types that can be `==` without being identical.
    pub fn insert(&mut self, key: usize, value: T) -> Option<T> {
        self.base.insert(key, value)
    }
}

impl<T: Default> IntoIterator for SparseArray<T> {
    type Item = (usize, T);

    type IntoIter = std::collections::hash_map::IntoIter<usize, T>;

    fn into_iter(self) -> Self::IntoIter {
        self.base.into_iter()
    }
}

impl<T: Default> std::ops::Index<usize> for SparseArray<T> {
    type Output = T;

    fn index(&self, index: usize) -> &Self::Output {
        self.base.get(&index).unwrap()
    }
}

impl<T: Default> std::ops::IndexMut<usize> for SparseArray<T> {
    fn index_mut(&mut self, index: usize) -> &mut Self::Output {
        // Rust doesn't have an IndexAssign trait that would let us overload
        //      arr[key] = value
        // so we overload the arr[key] call instead.
        if !self.base.contains_key(&index) {
            // Insert some default value, so the access doesn't fail.
            self.base.insert(index, T::default());
        }
        self.base.get_mut(&index).unwrap()
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    pub fn new_sparse_insert() {
        let mut a = sparse![];
        assert_eq!(a.base.len(), 0);
        a[2] = 3;
        assert_eq!(a[2], 3);
        a[9999] = 5;
        assert_eq!(a[9999], 5);
    }

    #[test]
    pub fn constructor() {
        let a: SparseArray<i32> = sparse![10, 20, 30];
        assert_eq!(a[2], 30);
    }
}
