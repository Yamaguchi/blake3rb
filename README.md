# BLAKE3 for Ruby

This library is implementation of BLAKE3 written in Ruby.

For more information, you can see https://github.com/BLAKE3-team/BLAKE3 .

## Installation

This library contains native extension made by Rust.
First, you must install Rust and Cargo.
see https://doc.rust-lang.org/cargo/getting-started/installation.html

Add this line to your application's Gemfile:

```ruby
gem 'blake3'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install blake3

## Usage

```ruby
require "blake3"

Blake3.hexdigest("hoge")
# => "77412ee5089c51bcf6568c621aa3a83081a6477b576ff19bfb31e9d657acd91a"

hasher = Blake3::Hasher.new
hasher.update("h")
hasher.update("o")
hasher.update("g")
hasher.update("e")
hasher.finalize
# => "77412ee5089c51bcf6568c621aa3a83081a6477b576ff19bfb31e9d657acd91a"

# Keyed Hash
hasher = Blake3::Hasher.new("I have a key")
hasher.update("h")
hasher.update("o")
hasher.update("g")
hasher.update("e")
hasher.finalize
# => "01cd3c62e5fd3fbf708f16cca9f5f9dadcbbc6e0c8687c9156dca43a2950a863"

# Derive Key
Blake3.derive_key("Context", "Input Key")
# => "e911a37d54141f6ed5a0c0b6168796a3533eff87c6fb40bdc56436f7c00f763f"
```

## Development

After checking out the repo,

- run `bin/setup` to install dependencies.
- Then, run `bundle exec rake build` to build native extension.
- Then, run `bundle exec rake spec` to run the tests.
- You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Yamaguchi/blake3rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Blake3rb project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Yamaguchi/blake3rb/blob/master/CODE_OF_CONDUCT.md).
