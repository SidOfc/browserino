# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'browserino/version'

Gem::Specification.new do |spec|
  spec.name          = "browserino"
  spec.version       = Browserino.version.full
  spec.authors       = ["Sidney Liebrand"]
  spec.email         = ["sidneyliebrand@gmail.com"]
  spec.summary       = %q{A browser identification gem with command line and Rails (>= 3.2.0) integration}
  spec.homepage      = "https://github.com/sidofc/browserino"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = ['browserino']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "codeclimate-test-reporter"
end
