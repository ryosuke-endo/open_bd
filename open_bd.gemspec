# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "open_bd/version"

Gem::Specification.new do |spec|
  spec.name          = "open_bd"
  spec.version       = OpenBD::VERSION
  spec.authors       = ["ryosuke-endo"]
  spec.email         = ["frozen_faithjp2@yahoo.co.jp"]

  spec.summary       = "An API client library for openBD API, written in Ruby."
  spec.homepage      = "https://github.com/ryosuke-endo/open_bd"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  spec.required_ruby_version = ">= 2.3"

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
end
