





use rustydav::client::Client;

pub struct DAVClient {
    pub url:String,
    pub username:String,
    pub password:String,
}
pub fn new_client(url:String,
                  username:String,
                  password:String,) ->DAVClient{
    DAVClient{
        url,
        username,
        password,
    }
}

impl DAVClient {
    fn get(&self) -> Client {
        Client::init(self.username.as_str(), self.password.as_str())
    }
    fn get_url(&self, path:&str) -> String {
       format!("{}{}",self.url,path)
    }
    pub fn write(&self, path:String, data:Vec<u8>) -> bool {
        let client=self.get();
        client.put(data, self.get_url(path.as_str()).as_str()).is_ok()
    }
    pub fn read(&self, path:String) -> Vec<u8> {
        let client=self.get();
        client.get(self.get_url(path.as_str()).as_str()).unwrap().bytes().unwrap().to_vec()
    }

}
