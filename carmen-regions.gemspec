# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'carmen/regions/version'

Gem::Specification.new do |spec|
  spec.name          = "carmen-regions"
  spec.version       = Carmen::Regions::VERSION
  spec.authors       = ["René Kersten"]
  spec.email         = ["rene.kersten@gmail.com"]
  spec.description   = %q{Add regions to Carmen::Country}
  spec.summary       = %q{Add regions to Carmen::Country}
  spec.homepage      = "https://github.com/endorfin/carmen-regions"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'carmen'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
