lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'numeritaj_tipo/version'

Gem::Specification.new do |spec|
  spec.name          = 'numeritaj_tipo'
  spec.version       = NumeritajTipo::VERSION
  spec.authors       = ['kajisha']
  spec.email         = ['kajisha@gmail.com']

  spec.summary       = %q{Numeritaj Tipo is enumerated type}
  spec.description   = %q{Numeritaj Tipo is enumerated type}
  spec.homepage      = 'https://github.com/kajisha/numeritaj_tipo'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'activerecord'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'mongoid'
  spec.add_development_dependency 'neo4j'
  spec.add_development_dependency 'rails'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'tapp'
end
