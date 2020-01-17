#[macro_use]
extern crate helix;

ruby! {
    class Blake3Internal {
        struct {
        }

        def initialize(helix) {
            Blake3Internal{helix}
        }

        def from_hex(&self, hex: std::string::String) ->  std::string::String {
            let decoded = hex::decode(hex).expect("Decoding failed");
            let hash = blake3::hash(&decoded[..]);
            format!("{}", hash.to_hex())
        }
    }    
}

#[test]
fn test() {
    let hex = "686f6765";
    let decoded = hex::decode(hex).expect("Decoding failed");
    let hash = blake3::hash(&decoded[..]);
    let hexdigest = format!("{}", hash.to_hex());
    assert_eq!(hexdigest, "77412ee5089c51bcf6568c621aa3a83081a6477b576ff19bfb31e9d657acd91a");
}