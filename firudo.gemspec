# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'firudo/version'

Gem::Specification.new do |spec|
  spec.name          = "firudo"
  spec.version       = Firudo::VERSION
  spec.authors       = ["ostaptan"]
  spec.email         = ["otan256@gmail.com"]
  spec.summary       = %q{Provides writing logs into files and filtering secure data for Sinatra based applications.}
  spec.homepage      = "https://github.com/ostaptan/firudo"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "sinatra",   "~> 1.4.0"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rack-test"
end
