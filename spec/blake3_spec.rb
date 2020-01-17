RSpec.describe Blake3 do
  it "has a version number" do
    expect(Blake3::VERSION).not_to be nil
  end

  it "hexdigest" do
    expect(Blake3.hexdigest("")).to eq "af1349b9f5f9a1a6a0404dea36dcc9499bcb25c9adc112b7cc9a93cae41f3262"
    expect(Blake3.hexdigest("hoge")).to eq "77412ee5089c51bcf6568c621aa3a83081a6477b576ff19bfb31e9d657acd91a"
  end
end
