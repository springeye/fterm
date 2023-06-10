
use rusqlite::{Connection, Result};
use anyhow;



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


    let me = Host {
        id: "123123".to_string(),
        title: "henjue-pc".to_string(),
        host: "127.0.01".to_string(),
        port: 0,
        username: "develop".to_string(),
        password: None,
        private_key: None,
    };
    conn.execute(
        "INSERT INTO host (id, title, host,port,username,password,private_key) VALUES (?1, ?2, ?3, ?4, ?5, ?6, ?7)",
        (&me.id, &me.title,&me.host,&me.port,&me.username,&me.password,&me.private_key),
    ).unwrap();

    conn
}
pub fn get_all_hosts(path:Option<String>) -> anyhow::Result<Vec<Host>> {
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
pub fn get_version() -> String {
    String::from("Hello from Rust! 🦀")
}