# frozen_string_literal: true

require 'json'

# The input in each case is filled with a 251-byte-long repeating pattern:
# 0, 1, 2, ..., 249, 250, 0, 1, ...
def create_input(len)
  (0...len).map { |i| i % 251 }.pack('C*')
end

RSpec.describe 'TestVectors' do
  path = "#{File.dirname(__FILE__)}/test_vectors.json"
  pp json = JSON.parse(File.read(path), symbolize_names: true)

  key = json[:key]

  json[:cases].each do |testcase|
    input = create_input(testcase[:input_len])
    it { expect(Blake3.hexdigest(input)).to eq testcase[:hash][0...64] }
    it { expect(Blake3.hexdigest(input, key: key)).to eq testcase[:keyed_hash][0...64] }
  end
end
