# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'watch/version'

Gem::Specification.new do |gem|
  gem.name          = "watch"
  gem.version       = Watch::VERSION
  gem.authors       = ["Morten Wilken"]
  gem.email         = ["wilken@ultraplex.org"]
  gem.description   = "Small utility for watching the liveness of URLs"
  gem.summary       = "Small utility for watching the liveness of URLs" 
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "eventmachine"
  gem.add_dependency "em-http-request"
  gem.add_dependency "em-websocket"
  gem.add_dependency "sinatra"
  gem.add_dependency "thin"
  gem.add_dependency "thor"

end
