require 'helix_runtime'

require 'blake3native/native'
require "blake3/version"

module Blake3
  module_function

  def hexdigest(plain)
    hex = plain.unpack1("H*")
    Blake3Internal.new.from_hex(hex)
  end

  def digest(plain)
    hex = hexdigest(plain)
    [hex].pack("H*")
  end

  class Hasher
    def initialize
      @hasher = Blake3Hasher.new
    end

    def update(plain)
      hex = plain.unpack1("H*")
      @hasher.update(hex)
    end

    def finalize
      @hasher.finalize
    end
  end
end
