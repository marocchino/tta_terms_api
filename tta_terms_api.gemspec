# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tta_terms_api/version'

Gem::Specification.new do |spec|
  spec.name          = "tta_terms_api"
  spec.version       = TtaTermsApi::VERSION
  spec.authors       = ["Shim Tw"]
  spec.email         = ["marocchino@gmail.com"]
  spec.summary       = %q{Ruby interface to 정보 통신 용어 사전(telecommunication word terms)}
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri", "~> 1.6.1"
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
