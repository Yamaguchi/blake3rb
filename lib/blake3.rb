require 'helix_runtime'

require 'blake3native/native'
require "blake3/version"

module Blake3
  module_function

  def hexdigest(plain)
    Hasher.hexdigest(plain)
  end

  def digest(plain)
    Hasher.digest(plain)
  end

  class Hasher
    def initialize
      @hasher = Blake3Hasher.new
    end

    def update(plain)
      hex = plain.unpack1("H*")
      @hasher.update(hex)
      self
    end

    def finalize
      @hasher.finalize
    end

    def self.digest(plain)
      new.update(plain).digest
    end

    def self.hexdigest(plain)
      new.update(plain).hexdigest
    end

    def digest
      [hexdigest].pack("H*")
    end

    def hexdigest
      finalize
    end
  end
end
