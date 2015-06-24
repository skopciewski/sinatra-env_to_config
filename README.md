# Sinatra EnvToConfig Extenstion

[![Gem Version](https://badge.fury.io/rb/sinatra-env_to_config.svg)](http://badge.fury.io/rb/sinatra-env_to_config)


Provided methods:
* `env_to_config(key1, key2, ...)`

which takes the proper values from ENV and places them in the settings.

## Installation

Add this line to your application's Gemfile:

    gem 'sinatra-env_to_config'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sinatra-env_to_config

## Usage

```ruby
require 'sinatra/base'
require 'sinatra/env_to_config'

class MyApp < Sinatra::Base
  register Sinatra::EnvToConfig

  env_to_config :key1, :key2

end
```

and then you can use it:

```ruby
puts settings.key1    # -> 'some value' or nil
puts ENV['key1']      # -> 'some value' or nil
```

## Versioning

See [semver.org][semver]

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[semver]: http://semver.org/
