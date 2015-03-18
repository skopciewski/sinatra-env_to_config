# encoding: utf-8

# Copyright (C) 2015 Szymon Kopciewski
#
# This file is part of SinatraEnvToConfig
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

require 'sinatra/base'

module Sinatra
  module EnvToConfig
    def env_to_config(*args)
      args.each { |key| set key, find_value_for_key(key) }
    end

    private

    def find_value_for_key(key)
      key_string = key.to_s
      ENV[key_string]
    end
  end
end
