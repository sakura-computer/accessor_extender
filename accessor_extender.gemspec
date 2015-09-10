# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'accessor_extender/version'

Gem::Specification.new do |spec|
  spec.name          = "accessor_extender"
  spec.version       = AccessorExtender::VERSION
  spec.authors       = ["sakura-computer"]
  spec.email         = ["ishimoto.masaru@sakura-computer.co.jp"]

  spec.summary       = "This gem simply extends cattr_accessor mattr_accessor like ActiveSupport."
  spec.description   = "This gem simply extends cattr_accessor mattr_accessor like ActiveSupport."
  spec.homepage      = "https://github.com/sakura-computer/accessor_extender"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 1.9.3"
    
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
