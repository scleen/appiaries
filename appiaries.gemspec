# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'appiaries/version'

Gem::Specification.new do |spec|
  spec.name          = "appiaries"
  spec.version       = Appiaries::VERSION
  spec.authors       = ["Scleen"]
  spec.email         = ["scleentube@gmail.com"]
  spec.description   = %q{}
  spec.summary       = %q{Ruby wrapper of Appiaries mBaaS API}
  spec.homepage      = "http://rubygems.org/gems/appiaries"
  spec.license       = "MIT"

  spec.files = Dir["README.md","Gemfile","Rakefile", "spec/*", "lib/**/*"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec"
  spec.add_dependency 'rest-client'
end
