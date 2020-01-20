# frozen_string_literal: true

require 'helix_runtime'

require 'blake3native/native'
require 'blake3/version'

module Blake3
  module_function

  def hexdigest(plain, key: nil)
    Hasher.hexdigest(plain, key: key)
  end

  def digest(plain, key: nil)
    Hasher.digest(plain, key: key)
  end

  class Hasher
    def initialize(key: nil)
      if key
        hex = key.unpack1('H*')
        @hasher = Blake3KeyedHasher.new(hex)
      else
        @hasher = Blake3Hasher.new
      end
    end

    def update(plain)
      hex = plain.unpack1('H*')
      @hasher.update(hex)
      self
    end

    def finalize
      @hasher.finalize
    end

    def self.digest(plain, key: nil)
      new(key: key).update(plain).digest
    end

    def self.hexdigest(plain, key: nil)
      new(key: key).update(plain).hexdigest
    end

    def digest
      [hexdigest].pack('H*')
    end

    def hexdigest
      finalize
    end
  end
end
