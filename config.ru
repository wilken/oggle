lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'watch'
require 'cli'

MyCLI.start(ARGV)
run Sinatra::Application
