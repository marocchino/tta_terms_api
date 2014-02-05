# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tta_terms_api/version'

Gem::Specification.new do |spec|
  spec.name          = "tta_terms_api"
  spec.version       = TtaTermsApi::VERSION
  spec.authors       = ["Shim Tw"]
  spec.email         = ["marocchino@gmail.com"]
  spec.summary       = %q{Ruby interface to Korean IT terms(정보 통신 용어 사전)}
  spec.description   = "It is unoffical API for Korean IT terms."
  spec.homepage      = "https://github.com/marocchino/tta_terms_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6"
  spec.add_dependency "moneta", "~> 0.7"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "rspec", "~> 2.14"
end
