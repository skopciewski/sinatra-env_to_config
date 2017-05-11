# frozen_string_literal: true

require "spec_helper"
require "sinatra/env_to_config"

def mock_app(&block)
  Sinatra.new(Sinatra::Base) do
    register Sinatra::EnvToConfig
    class_eval(&block)
  end
end

module Sinatra
  describe EnvToConfig do
    context "when try to get key which was not defined" do
      Given(:app) { mock_app {} }
      Then { expect(app.settings).not_to respond_to(:unknown_key) }
    end

    context "when try to get defined key" do
      Given(:app) { mock_app { env_to_config :key1 } }
      Then { expect(app.settings).to respond_to(:key1) }
    end

    context "when try to get many defined key" do
      Given(:app) { mock_app { env_to_config :key1, :key2, :key3 } }
      Then { expect(app.settings).to respond_to(:key1) }
      Then { expect(app.settings).to respond_to(:key2) }
      Then { expect(app.settings).to respond_to(:key3) }
      Then { expect(app.settings).not_to respond_to(:key4) }
    end

    context "when key exists in env" do
      Given(:value) { "some data" }
      Given { ENV["key"] = value }
      Given(:app) { mock_app { env_to_config :key } }
      Then { expect(app.settings.key).to eq(value) }
    end

    context "when key does not exists in env" do
      Given(:app) { mock_app { env_to_config :missing_key } }
      Then { expect(app.settings.missing_key).to be_nil }
    end

    context "when key is a string" do
      Given(:app) { mock_app { env_to_config "string_key" } }
      Then { expect(app.settings.string_key).to be_nil }
    end

    context "when key is in upper case" do
      Given(:app) { mock_app { env_to_config "UPPER_KEY" } }
      Then { expect(app.settings).to respond_to(:upper_key) }
      Then { expect(app.settings.upper_key).to be_nil }
      Then { expect(app.settings).not_to respond_to(:UPPER_KEY) }
    end
  end
end
