# frozen_string_literal: true

RAKEFILE = 'native.rake'

def command_exists(command, *extra_test_arguments)
  raise "Command #{command} not found. exitting..." unless system(command, *extra_test_arguments)
end

command_exists('cargo', '--version')
command_exists('rustc', '--version')

File.open('Makefile', 'w') do |makefile|
  makefile.puts <<~MAKEFILE
    clean:
    \trake -f #{RAKEFILE} clobber
    install:
    \trake -f #{RAKEFILE} build
  MAKEFILE
end

File.open(RAKEFILE, 'w') do |rakefile|
  rakefile.puts <<~RUBY
    require 'helix_runtime/build_task'
    HelixRuntime::BuildTask.new
  RUBY
end
