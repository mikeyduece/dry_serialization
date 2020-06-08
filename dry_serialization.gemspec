
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dry_serialization/version'
require 'dry_serialization'

Gem::Specification.new do |spec|
  spec.name          = 'dry_serialization'
  spec.version       = DrySerialization::VERSION
  spec.authors       = ['Mike Heft']
  spec.email         = ['mikeheft@gmail.com']

  spec.summary       = %q{Drys up serialized returns by passing in object, serializer, and an options hash}
  #spec.description   = %q{TODO: Write a longer description or delete this line.}
  #spec.homepage      = 'TODO: Put your gem's website or public repo URL here.'
  spec.license       = 'MIT'

  spec.files = Dir['lib/**/*', 'CHANGELOG.md', 'MIT-LICENSE', 'Rakefile', 'README.md', 'dry_serialization.gemspec']
  
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rspec', '~> 3.7'
  spec.add_development_dependency 'factory_bot'
  spec.add_development_dependency 'generator_spec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'activerecord'
  spec.add_development_dependency 'sqlite3', '~> 1.4'
  spec.add_development_dependency 'yard', '~> 0.9.11'
  spec.add_development_dependency 'fast_jsonapi'
end