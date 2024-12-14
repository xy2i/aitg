use proc_macro2::TokenStream;
use quote::quote;
use syn::{parse_macro_input, Data, DeriveInput, Type};

#[proc_macro_derive(MyDeserialize)]
pub fn derive_my_deserialize(input: proc_macro::TokenStream) -> proc_macro::TokenStream {
    let input = parse_macro_input!(input as DeriveInput);
    let name = &input.ident;

    let data = match &input.data {
        Data::Struct(s) => s,
        _ => panic!("Deserialize can only be derived for structs"),
    };

    // For each field in the struct, we:
    // - Extract the field name
    // - Determine the field type
    // - Generate code to find the matching key in the parsed map and convert it
    let field_inits = data.fields.iter().map(|f| {
        let ident = f.ident.as_ref().unwrap();
        let field_name_str = ident.to_string();

        // Identify the type of the field. We'll handle `String` and `i32`.
        let ty = &f.ty;
        let init = if is_type_string(ty) {
            quote! {
                crate::save::de::Visitor::visit_string(map.get(#field_name_str).unwrap())
            }
        } else if is_type_f64(ty) {
            quote! {
                crate::save::de::Visitor::visit_f64(map.get(#field_name_str).unwrap())
            }
        } else {
            // If we encounter a field type we don't handle, just default.
            // You could panic or implement other logic here.
            quote! { Default::default() }
        };

        quote! {
            #ident: #init
        }
    });

    let expanded = quote! {
        impl crate::save::de::Deserialize for #name {
            fn deserialize(input: &[u8]) -> Self {
                let map = crate::save::parse::read_sol(input);
                #name {
                    #(#field_inits),*
                }
            }
        }
    };

    TokenStream::from(expanded).into()
}

fn is_type_string(ty: &Type) -> bool {
    match ty {
        Type::Path(tp) => tp
            .path
            .segments
            .last()
            .map_or(false, |seg| seg.ident == "String"),
        _ => false,
    }
}

fn is_type_f64(ty: &Type) -> bool {
    match ty {
        Type::Path(tp) => tp
            .path
            .segments
            .last()
            .map_or(false, |seg| seg.ident == "f64"),
        _ => false,
    }
}
