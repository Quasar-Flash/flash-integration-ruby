# frozen_string_literal: true

require "faraday"
require "faraday/multipart"

require "flash/integration/version"
require "flash/integration/response"
require "flash/integration/request"
require "flash/integration/connection"

module Flash::Integration
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end
  end

  def self.configure
    self.configuration ||= Configuration.new

    yield(configuration)
  end

  class Configuration
  end
end
