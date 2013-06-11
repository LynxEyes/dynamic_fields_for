# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dynamic_fields_for/version'

Gem::Specification.new do |gem|
  gem.name          = "dynamic_fields_for"
  gem.version       = DynamicFieldsFor::VERSION
  gem.authors       = ["Ivo Jesus"]
  gem.email         = ["ivo.jesus@gmail.com"]
  gem.description   = %q{Simplify forms with nested attributes}
  gem.summary       = %q{Small lib to simplify the creation of forms with nested model attributes.}
  gem.homepage      = "https://github.com/LynxEyes/dynamic_fields_for"

  gem.files         = `git ls-files`.split($/)
  # gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency %q<rails>, [">= 3.1.0"]
  gem.add_runtime_dependency %q<coffee-rails>
  gem.add_runtime_dependency %q<jquery-rails>
end
