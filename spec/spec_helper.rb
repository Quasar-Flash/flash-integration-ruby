# frozen_string_literal: true

require "rubygems"
require "bundler"
require "pry"
require "flash_integration"

begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  warn e.message
  warn "Run `bundle install` to install missing gems"

  exit e.status_code
end

require "simplecov"

SimpleCov.start do
  add_filter "spec"
end

RSpec.configure do |config|
  config.alias_example_group_to :detail, detailed: true
end
