# frozen_string_literal: true

require "simplecov"

SimpleCov.formatters = [SimpleCov::Formatter::HTMLFormatter]
SimpleCov.minimum_coverage 70.0

SimpleCov.start do
  add_filter "/spec/"
  minimum_coverage 70
  minimum_coverage_by_file 40
end

require "rubygems"
require "bundler"
require "flash_integration"
require "pry"

Dir["./spec/support/**/*.rb"].each { |f| require f }
Dir["./spec/initializers/**/*.rb"].each { |f| require f }
Dir["./lib/**/*.rb"].sort.each { |file| require file }

begin
  Bundler.setup(:default, :development, :test)
rescue Bundler::BundlerError => e
  warn e.message
  warn "Run `bundle install` to install missing gems"

  exit e.status_code
end

RSpec.configure do |config|
  config.alias_example_group_to :detail, detailed: true
end
