use std::sync::{Arc, Mutex};
pub use rusqlite::{Connection, Error, Result};
use anyhow;
use flutter_rust_bridge::{DartAbi, frb, RustOpaque};
use flutter_rust_bridge::ffi::ffi::DartCObject;


//
#[derive(Debug)]
pub struct Host {
    pub id: String,
    pub title: String,
    pub host:String,
    pub port:u32,
    pub username: String,
    pub password: Option<String>,
    pub private_key: Option<String>,
}

fn get_db(path:Option<String>) -> Connection {

    let conn = match path {
        None => {
            Connection::open_in_memory().unwrap()
        }
        Some(path) => {
            Connection::open(path).unwrap()
        }
    };
     let version:Result<String> =conn.query_row("PRAGMA cipher_version",[], |row| row.get(0));
    let v=version.expect("当前数据平台不支持加密数据库");
    println!("支持加密========>{}", v);
    conn.execute(
        "CREATE TABLE if not exists host (
            id    varchar(32) PRIMARY KEY,
            title varchar NOT NULL,
            host  varchar NOT NULL,
            port  int  NOT NULL,
            username  varchar NOT NULL,
            password  varchar,
            private_key  varchar
        )",
        (), // empty list of parameters.
    ).unwrap();
    conn
}
pub fn insert(path:Option<String>,host:Host) -> usize {
    let conn=get_db(path);
    conn.execute(
        "INSERT INTO host (id, title, host,port,username,password,private_key) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7)",
        (&host.id, &host.title,&host.host,&host.port,&host.username,&host.password,&host.private_key),
    ).unwrap()
}
pub fn update(path:Option<String>,host:Host) -> usize {
    let conn=get_db(path);
    conn.execute(
        "update host set title=?1, host=?2,port=?3,username=?4,password=?5,private_key=?6 where id = ?7",
        (&host.title,&host.host,&host.port,&host.username,&host.password,&host.private_key,&host.id, ),
    ).unwrap()
}
pub fn delete(path:Option<String>,id:String) -> usize {
    let conn=get_db(path);
    conn.execute(
        "DELETE FROM table_name WHERE where id = ?1",
        (&id,),
    ).unwrap()
}

pub fn findAll(path:Option<String>) -> anyhow::Result<Vec<Host>> {
    let conn=get_db(path);

    let mut stmt = conn.prepare("SELECT id, title, host,port,username,password,private_key FROM host").unwrap();
    let hosts = stmt.query_map([], |row| {

        Ok(Host {
            id: row.get(0)?,
            title: row.get(1)?,
            host: row.get(2)?,
            port: row.get(3)?,
            username: row.get(4)?,
            password: row.get(5)?,
            private_key: row.get(6)?,
        })
    }).unwrap();


    let mut results =Vec::new();
    for host in hosts {
        let v = host.unwrap();
        results.push(v);
    }
    drop(stmt);
    conn.close().unwrap();
    anyhow::Ok(results)


}
