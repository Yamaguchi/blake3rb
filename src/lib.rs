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

    class Blake3KeyedHasher {
        struct {
            hasher: blake3::Hasher,
        }

        def initialize(helix, key: std::string::String ) {
            let mut array = [0; 32];
            let vec = hex::decode(key).expect("Decoding failed");
            let bytes = &vec[..array.len()];
            array.copy_from_slice(bytes);
            Blake3KeyedHasher {
                helix,
                hasher: blake3::Hasher::new_keyed(&array),
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

    class Blake3Key {
        struct {

        }

        def initialize(helix) {
            Blake3Key {
                helix,
            }
        }

        def derive(&self, context: std::string::String, hex: std::string::String) -> std::string::String {
            let mut output = [0; 32];
            let key_material = hex::decode(hex).expect("Decoding failed");
            blake3::derive_key(&context, &key_material[..], &mut output);
            hex::encode(output)
        }
    }
}
