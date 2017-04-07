# Sinatra EnvToConfig Extenstion

[![Gem Version](https://badge.fury.io/rb/sinatra-env_to_config.svg)](http://badge.fury.io/rb/sinatra-env_to_config)
[![Code Climate](https://codeclimate.com/github/skopciewski/sinatra-env_to_config/badges/gpa.svg)](https://codeclimate.com/github/skopciewski/sinatra-env_to_config)
[![Dependency Status](https://gemnasium.com/badges/github.com/skopciewski/sinatra-env_to_config.svg)](https://gemnasium.com/github.com/skopciewski/sinatra-env_to_config)

Provided method:
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
puts settings.key1    # -> 'foo'
puts ENV['key1']      # -> 'foo'
```

You should give the same variable as in the ENV, as an argument to 
the `env_to_config` function, but all variables are set in lower case:

```ruby
ENV['VaR1']   # => 'foo'
env_to_config 'VaR1'
settings.var1   # => 'foo'
settings.VaR1   # => NoMethodError
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
