# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oggle/version'

Gem::Specification.new do |gem|
  gem.name          = "oggle"
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

  gem.add_runtime_dependency "eventmachine", "=1.0.1"
  gem.add_runtime_dependency "sinatra", "=1.3.5"
  gem.add_runtime_dependency "sinatra-websocket", "=0.2.1"
  gem.add_runtime_dependency "em-http-request", "=1.0.3"
  gem.add_runtime_dependency "thin", "=1.5.0"
  gem.add_runtime_dependency "thor", "=0.17.0"
  gem.add_runtime_dependency "json", "=1.7.7"

end
