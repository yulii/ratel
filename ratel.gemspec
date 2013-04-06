# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ratel/version'

Gem::Specification.new do |gem|
  gem.name          = "ratel"
  gem.version       = Ratel::VERSION
  gem.authors       = ["yulii"]
  gem.email         = ["yuliinfo@gmail.com"]
  gem.description   = %q{a/b testing module}
  gem.summary       = %q{a/b testing module}
  gem.homepage      = "https://github.com/yulii/ratel"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "rails", "~>3.2.11"
end
