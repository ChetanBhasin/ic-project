use std::env;

fn main() {
    // Retrieve bucket name from environment variable or set a default
    let bucket_name =
        env::var("BUCKET_NAME").unwrap_or_else(|_| String::from("default-bucket-name"));

    // Retrieve object size from environment variable or set a default. Parse it as an usize.
    let object_size = env::var("OBJECT_SIZE")
        .unwrap_or_else(|_| String::from("100"))
        .parse::<usize>()
        .unwrap_or(100); // In case of invalid usize, default to 100.

    // Retrieve object count from environment variable or set a default. Parse it as an usize.
    let object_count = env::var("OBJECT_COUNT")
        .unwrap_or_else(|_| String::from("10"))
        .parse::<usize>()
        .unwrap_or(10); // In case of invalid usize, default to 10.

    // Rest of your program...

    println!("Bucket Name: {}", bucket_name);
    println!("Object Size: {}", object_size);
    println!("Object Count: {}", object_count);
}
