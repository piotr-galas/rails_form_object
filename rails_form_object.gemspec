# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_form_object/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_form_object'
  spec.version       = RailsFormObject::VERSION
  spec.authors       = ['Piotr']
  spec.email         = ['galaspiotrek@gmail.com']

  spec.summary       = 'It allows to create very simple form object behave like active model'
  spec.description   = 'If you want to decouple validations from model it would be probably the easiest solution'
  spec.homepage      = 'https://github.com/piotr-galas/rails_form_object'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.49.1'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'activemodel'
  spec.add_development_dependency 'activeview'
  spec.add_development_dependency 'pry'

end
