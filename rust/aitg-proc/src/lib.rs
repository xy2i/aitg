use std::str::FromStr;

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

use proc_macro2::{Group, Literal, TokenStream as TokenStream2, TokenTree};
use syn::{
    visit_mut::VisitMut, Attribute, Expr, ExprMacro, File, ItemMacro, Lit, LitInt, Macro, Meta,
    Stmt,
};

struct NumberFloatifier;

impl VisitMut for NumberFloatifier {
    fn visit_file_mut(&mut self, file: &mut File) {
        // Before visiting the rest of the file, handle attributes on the file itself
        for attr in &mut file.attrs {
            transform_attribute(attr);
        }
        syn::visit_mut::visit_file_mut(self, file);
    }

    fn visit_item_mod_mut(&mut self, item_mod: &mut syn::ItemMod) {
        // Handle attributes on modules
        for attr in &mut item_mod.attrs {
            transform_attribute(attr);
        }
        syn::visit_mut::visit_item_mod_mut(self, item_mod);
    }

    fn visit_item_fn_mut(&mut self, func: &mut syn::ItemFn) {
        // Handle attributes on functions
        for attr in &mut func.attrs {
            transform_attribute(attr);
        }
        syn::visit_mut::visit_item_fn_mut(self, func);
    }

    fn visit_item_struct_mut(&mut self, item_struct: &mut syn::ItemStruct) {
        // Handle attributes on the struct itself
        for attr in &mut item_struct.attrs {
            transform_attribute(attr);
        }
        // Handle attributes on fields
        if let syn::Fields::Named(fields) = &mut item_struct.fields {
            for field in &mut fields.named {
                for attr in &mut field.attrs {
                    transform_attribute(attr);
                }
            }
        } else if let syn::Fields::Unnamed(fields) = &mut item_struct.fields {
            for field in &mut fields.unnamed {
                for attr in &mut field.attrs {
                    transform_attribute(attr);
                }
            }
        }
        syn::visit_mut::visit_item_struct_mut(self, item_struct);
    }

    fn visit_item_enum_mut(&mut self, item_enum: &mut syn::ItemEnum) {
        // Handle attributes on the enum itself
        for attr in &mut item_enum.attrs {
            transform_attribute(attr);
        }
        // Handle attributes on variants and their fields
        for variant in &mut item_enum.variants {
            for attr in &mut variant.attrs {
                transform_attribute(attr);
            }
            if let syn::Fields::Named(fields) = &mut variant.fields {
                for field in &mut fields.named {
                    for attr in &mut field.attrs {
                        transform_attribute(attr);
                    }
                }
            } else if let syn::Fields::Unnamed(fields) = &mut variant.fields {
                for field in &mut fields.unnamed {
                    for attr in &mut field.attrs {
                        transform_attribute(attr);
                    }
                }
            }
        }
        syn::visit_mut::visit_item_enum_mut(self, item_enum);
    }

    fn visit_impl_item_fn_mut(&mut self, method: &mut syn::ImplItemFn) {
        // Handle attributes on methods in impl blocks
        for attr in &mut method.attrs {
            transform_attribute(attr);
        }
        syn::visit_mut::visit_impl_item_fn_mut(self, method);
    }

    fn visit_trait_item_fn_mut(&mut self, method: &mut syn::TraitItemFn) {
        // Handle attributes on methods in traits
        for attr in &mut method.attrs {
            transform_attribute(attr);
        }
        syn::visit_mut::visit_trait_item_fn_mut(self, method);
    }

    fn visit_attribute_mut(&mut self, attr: &mut Attribute) {
        // If we didn't cover all cases above, this will also handle attributes encountered generally
        transform_attribute(attr);
        syn::visit_mut::visit_attribute_mut(self, attr);
    }

    fn visit_lit_mut(&mut self, lit: &mut Lit) {
        if let Lit::Int(lit_int) = lit {
            let val = lit_int.base10_digits();
            let new_lit_str = format!("{}.", val);
            let new_lit: Lit =
                syn::parse_str(&new_lit_str).expect("Failed to parse transformed float literal");
            *lit = new_lit;
        }
        syn::visit_mut::visit_lit_mut(self, lit);
    }

    fn visit_macro_mut(&mut self, mac: &mut Macro) {
        mac.tokens = transform_tokens(mac.tokens.clone());
        syn::visit_mut::visit_macro_mut(self, mac);
    }
}

/// Transform all integer literals in the attribute’s token stream.
fn transform_attribute(attr: &mut Attribute) {
    transform_meta(&mut attr.meta);
}

/// Transforms all integer literals in a TokenStream into float literals by appending a dot.
fn transform_tokens(input: TokenStream2) -> TokenStream2 {
    let mut output = TokenStream2::new();

    for tt in input {
        let transformed = match tt {
            TokenTree::Literal(lit) => {
                let lit_str = lit.to_string();
                if is_pure_integer_literal(&lit_str) {
                    let new_str = format!("{}.", lit_str);
                    TokenTree::Literal(syn::parse_str(&new_str).unwrap())
                } else {
                    TokenTree::Literal(lit)
                }
            }
            TokenTree::Group(g) => {
                let new_stream = transform_tokens(g.stream());
                let mut new_group = proc_macro2::Group::new(g.delimiter(), new_stream);
                new_group.set_span(g.span());
                TokenTree::Group(new_group)
            }
            other => other,
        };
        output.extend(std::iter::once(transformed));
    }

    output
}

fn transform_meta(meta: &mut Meta) {
    match meta {
        Meta::Path(_) => {
            // e.g. #[something]
            // No tokens to transform here.
        }
        Meta::List(ml) => {
            // e.g. #[default(1861)]
            // Transform the tokens inside the parentheses.
            ml.tokens = transform_tokens(ml.tokens.clone());
        }
        Meta::NameValue(mnv) => {
            // e.g. #[some_attr = 1861]
            // Transform the expression on the right-hand side
            // by visiting it with our visitor.
            let mut visitor = NumberFloatifier;
            visitor.visit_expr_mut(&mut mnv.value);
        }
    }
}

/// Checks if a string is a pure integer literal without suffixes.
/// Examples of pure integers: "42", "100"
/// Not pure integers: "42u32", "0xFF", "0b1010" (leading zero/hex/binary), "42." (already float)
fn is_pure_integer_literal(s: &str) -> bool {
    // A pure integer literal in Rust can be decimal without prefixes and suffixes.
    // We do not handle underscores here. If underscores appear, they are still valid integers.
    s.chars().all(|c| c.is_ascii_digit())
}

/// Procedural macro attribute that will convert all integer literals in the annotated
/// code and in macro invocations to float literals by appending a dot.
#[proc_macro_attribute]
pub fn floatify_numbers(
    _attr: proc_macro::TokenStream,
    item: proc_macro::TokenStream,
) -> proc_macro::TokenStream {
    let mut ast = parse_macro_input!(item as File);
    let mut visitor = NumberFloatifier;
    visitor.visit_file_mut(&mut ast);

    TokenStream::from(quote!(#ast)).into()
}
