# frozen_string_literal: true

begin
  require "./lib/sinatra-env_to_config/version"
rescue LoadError
  module SinatraEnvToConfig; VERSION = "0"; end
end

Gem::Specification.new do |spec|
  spec.name          = "sinatra-env_to_config"
  spec.version       = SinatraEnvToConfig::VERSION
  spec.authors       = ["Szymon Kopciewski"]
  spec.email         = "s.kopciewski@gmail.com"
  spec.summary       = "The Sinatra extension for adding options from the env variables "
  spec.description   = <<~EOT
    Provides the dsl method for adding the configuration options ported
    from the matching env variables.
  EOT
  spec.homepage      = "https://github.com/skopciewski/sinatra-env_to_config"
  spec.license       = "GPL-3.0"

  spec.require_paths = ["lib"]
  spec.files = Dir.glob("{bin,lib}/**/*") + \
               %w(Gemfile LICENSE README.md CHANGELOG.md)

  spec.add_runtime_dependency "sinatra", "~>1", ">=1.4"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-given"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "codeclimate-test-reporter"
end
