use std::collections::HashMap;
use std::ffi::{c_char, CStr, CString};
use std::io::{BufRead, BufReader, Write};
use std::sync::{Arc, Mutex};
use std::thread;
use allo_isolate::ffi::DartCObject;
use allo_isolate::IntoDart;
use dart_sys::{Dart_Port};
use flutter_rust_bridge::rust2dart::Rust2Dart;
use flutter_rust_bridge::{DartAbi, DartObject, DartSafe, opaque_dyn, RustOpaque};
use portable_pty::{CommandBuilder, native_pty_system, PtyPair, PtySize};

pub type Channel = allo_isolate::Isolate;
pub struct Column {
    pub name:String,
    pub value:DartAbi,
}
pub fn query()->Vec<Column>{
    let mut results =Vec::new();
    results.push( Column{ name: "".to_string(), value: 123.into_dart() });
    results.push( Column{ name: "".to_string(), value: 123.into_dart() });
    results

}
