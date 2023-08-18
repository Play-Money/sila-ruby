
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sila-ruby/version'

Gem::Specification.new do |spec|
  spec.name = 'sila-ruby'
  spec.version = SilaRuby::VERSION
  spec.licenses = ['MIT']
  spec.authors = ['Vertbase']
  spec.email = ['dev@vertbase.com']

  spec.summary = 'Ruby implementation of the Sila API'
  spec.description = 'Ruby implementation of the Sila API'
  spec.homepage = 'https://github.com/vertbase/sila-ruby'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'addressable', '~> 2.6'
  spec.add_dependency 'json', '~> 2.2'
  spec.add_dependency 'httparty', '~> 0.17'
  spec.add_dependency 'dotenv', '~> 2.7'
  spec.add_dependency 'eth'

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.16.0'
  spec.add_development_dependency 'simplecov-console', '~> 0.5.0'
end
