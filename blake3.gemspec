# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blake3/version'

Gem::Specification.new do |spec|
  spec.name          = 'blake3'
  spec.version       = Blake3::VERSION
  spec.authors       = ['Hajime Yamaguchi']
  spec.email         = ['gen.yamaguchi0@gmail.com']

  spec.summary       = 'Blake3 for Ruby'
  spec.description   = 'Blake3 for Ruby'
  spec.homepage      = 'https://github.com/Yamaguchi/blake3rb'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added
  # into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.extensions = %w[ext/extconf.rb]
  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '>= 12.3.3'
  spec.add_development_dependency 'rspec', '~> 3.0'

  spec.add_runtime_dependency 'helix_runtime', '= 0.7.5'
end
