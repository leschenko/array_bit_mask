# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'array_bit_mask/version'

Gem::Specification.new do |gem|
  gem.name = 'array_bit_mask'
  gem.version = ArrayBitMask::VERSION
  gem.authors = ['Alex Leschenko']
  gem.email = %w(leschenko.al@gmail.com)
  gem.summary = %q{Generates bit mask for attribute from array of values}
  gem.description = %q{Creates methods that accepts array of values and save them as bit mask extracted using specified source}
  gem.homepage = 'https://github.com/leschenko/array_bit_mask'

  gem.files = `git ls-files`.split($/)
  gem.executables = gem.files.grep(%r{^bin/}).map { |f| File.basename(f) }
  gem.test_files = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = %w(lib)

  gem.add_dependency 'activesupport'

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
end
