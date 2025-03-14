use std::io::Read;
use std::net::TcpStream;

pub struct CFG {}

fn main() {
    let port = 60_000;
    let line = format!("[{}] - ", "2010/03/17 xx:yy");

    println!("{}", line);

    let mut stream = TcpStream::connect(("localhost", 60_000)).unwrap();
    let mut stri = String::new();
    unsafe {
        stream.read(stri.as_bytes_mut()).unwrap();
    }
    println!("{}", stri)
}
