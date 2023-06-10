use rusqlite::{Connection, Result};
//
// #[derive(Debug)]
// struct Person {
//     id: i32,
//     name: String,
//     data: Option<Vec<u8>>,
// }
fn db_version() {
    let conn = Connection::open_in_memory().unwrap();
     let version:Result<String> =conn.query_row("PRAGMA cipher_version",[], |row| row.get(0));
    let is_cipher = match version {
        Ok(_) => { true }
        Err(_) => { false }
    };
    println!("支持加密========>{}", is_cipher);
}

pub fn get_version() -> String {
    String::from("Hello from Rust! 🦀")
}
#[cfg(test)]
mod tests {
    use crate::api::db_version;

    #[test]
    fn test_db_version() {
        db_version();
    }
}