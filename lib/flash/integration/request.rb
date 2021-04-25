# frozen_string_literal: true

module Flash
  module Integration
    class Request
      attr_reader :method, :url, :params, :headers, :body, :time

      def initialize(attributes)
        @method = attributes.fetch(:method)
        @url = attributes.fetch(:url)
        @params = attributes[:params] || {}
        @headers = attributes[:headers] || {}
        @body = attributes[:body] || {}
        @time = attributes[:time] || Time.now.utc
      end
    end
  end
end
