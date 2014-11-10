# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rekognize/version'

Gem::Specification.new do |spec|
  spec.name          = "rekognize"
  spec.version       = Rekognize::VERSION
  spec.authors       = ["Dennis de Vulder"]
  spec.email         = ["dennisdevulder@gmail.com"]
  spec.description   = %q{}
  spec.summary       = %q{Ruby wrapper of Rekognition Face and Scenery Detection and Recognition API}
  spec.homepage      = "http://rubygems.org/gems/rekognize"
  spec.license       = "MIT"

  spec.files = Dir["README.md","Gemfile","Rakefile", "spec/*", "lib/**/*"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rspec"
  spec.add_dependency 'rest-client'
end
