# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cropster/version'

Gem::Specification.new do |spec|
  spec.name          = "cropster"
  spec.version       = Cropster::VERSION
  spec.authors       = ["Casey Gipson"]
  spec.email         = ["caseyg@bluebottlecoffee.com"]
  spec.summary       = %q{Get cropster green lot and roast data}
  spec.description   = %q{Get cropster green lot and roast data}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "typhoeus"
  
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
