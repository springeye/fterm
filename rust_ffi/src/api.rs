use std::path::Path;
use std::time;
use allo_isolate::IntoDart;
use flutter_rust_bridge::DartAbi;
use rusqlite::{Connection, LoadExtensionGuard, backup,hooks};
use rusqlite::ffi::sqlite3_update_hook;
use anyhow::{Ok,Error};
pub type Result<T, E = Error> = anyhow::Result<T, E>;
pub type Channel = allo_isolate::Isolate;
pub struct Column {
    pub name:String,
    pub value:DartAbi,
}
pub  fn query() -> Result<Vec<Column>> {
    let con=Connection::open_in_memory()?;
    // con.update_hook(Some(callback));
    let mut results =Vec::new();
    results.push( Column{ name: "".to_string(), value: 123.into_dart() });
    results.push( Column{ name: "".to_string(), value: 123.into_dart() });
    Ok(results)

}
