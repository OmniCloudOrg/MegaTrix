use std::collections::HashMap;
use std::io::{Write, Read, BufReader, BufRead};
use std::net::TcpStream;

use chrono::Utc;

pub struct CFG {}

pub struct Metric {
    time: chrono::DateTime<Utc>,
    points: HashMap<String, String>,
}

fn main() {
    let port = 60_000;
    let line = format!("[{}] - Test message from Sub-A-Tron\n", Utc::now().format("%Y/%m/%d %H:%M:%S"));

    match TcpStream::connect(("localhost", port)) {
        Ok(mut stream) => {
            // Send message
            if let Err(e) = stream.write_all(line.as_bytes()) {
                eprintln!("Failed to send message: {}", e);
            } else {
                println!("Successfully sent message to megatrix");
                
                // Read server response line by line
                let mut reader = BufReader::new(&stream);
                let mut response = String::new();
                if let Err(e) = reader.read_line(&mut response) {
                    eprintln!("Failed to read server response: {}", e);
                } else {
                    println!("Server response: {}", response.trim());
                }
            }
        }
        Err(e) => {
            eprintln!("Failed to connect to megatrix: {}", e);
        }
    }
}
