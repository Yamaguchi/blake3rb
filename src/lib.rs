#[macro_use]
extern crate helix;

ruby! {
    class Blake3Hasher {
        struct {
            hasher: blake3::Hasher,
        }

        def initialize(helix) {
            Blake3Hasher {
                helix,
                hasher: blake3::Hasher::new(),
            }
        }

        def update(&mut self, hex: std::string::String) {
            let decoded = hex::decode(hex).expect("Decoding failed");
            self.hasher.update(&decoded[..]);
        }

        def finalize(&mut self) -> std::string::String {
            format!("{}", self.hasher.finalize().to_hex())
        }
    }

    class Blake3Internal {
        struct {
        }

        def initialize(helix) {
            Blake3Internal { helix }
        }

        def from_hex(&self, hex: std::string::String) ->  std::string::String {
            let decoded = hex::decode(hex).expect("Decoding failed");
            let hash = blake3::hash(&decoded[..]);
            format!("{}", hash.to_hex())
        }
    }
}
