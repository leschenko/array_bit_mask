# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bit_mask/version'

Gem::Specification.new do |gem|
  gem.name = "bit_mask"
  gem.version = BitMask::VERSION
  gem.authors = ["Alex Leschenko"]
  gem.email = ["leschenko.al@gmail.com"]
  gem.summary = %q{Generates bit mask for attribute from array of values}
  gem.description = %q{Creates methods that accepts array of values and save them as bit mask extracted using specified source}
  gem.homepage = ""

  gem.files = `git ls-files`.split($/)
  gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_runtime_dependency 'activesupport'
end
