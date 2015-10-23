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

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
