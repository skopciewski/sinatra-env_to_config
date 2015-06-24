# coding: utf-8

begin
  require './lib/sinatra-env_to_config/version'
rescue LoadError
  module SinatraEnvToConfig; VERSION = '0'; end
end

Gem::Specification.new do |spec|
  spec.name          = 'sinatra-env_to_config'
  spec.version       = SinatraEnvToConfig::VERSION
  spec.authors       = ['Szymon Kopciewski']
  spec.email         = 's.kopciewski@gmail.com'
  spec.summary       = 'The Sinatra extension for adding options from the env variables '
  spec.description   = <<-EOF
    Provides the dsl method for adding the configuration options ported
    from the matching env variables.
  EOF
  spec.homepage      = 'https://github.com/skopciewski/sinatra-env_to_config'
  spec.license       = 'GPL-3.0'

  spec.files         = Dir.glob('{bin,lib}/**/*') + \
                       %w(Gemfile LICENSE README.md CHANGELOG.md)
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'sinatra', '>=1.4'

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-given'

end
