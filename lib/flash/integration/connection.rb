# frozen_string_literal: true

module Flash
  module Integration
    class Connection
      attr_reader :base_url

      def initialize(base_url:, request_class: Faraday)
        @request_class = request_class
        @base_url = base_url
      end

      def get(url: "", params: {}, headers: {})
        send_request(
          method: :get,
          url:,
          params:,
          headers:
        )
      end

      def post(url: "", params: {}, headers: {}, body: {}, multipart: false)
        send_request(
          method: :post,
          url:,
          params:,
          headers:,
          body:,
          multipart:
        )
      end

      def put(url: "", params: {}, headers: {}, body: {})
        send_request(
          method: :put,
          url:,
          params:,
          headers:,
          body:
        )
      end

      def patch(url: "", params: {}, headers: {}, body: {})
        send_request(
          method: :patch,
          url:,
          params:,
          headers:,
          body:
        )
      end

      def delete(url: "", params: {}, headers: {}, body: {})
        send_request(
          method: :delete,
          url:,
          params:,
          headers:,
          body:
        )
      end

      def default_headers
        {}
      end

      private
        def send_request(method:, url:, params:, headers:, body: nil, multipart: false)
          connection = multipart ? multipart_connection : @request_class.new(url: @base_url)

          merged_headers = default_headers.merge(headers)

          request = build_request(
            method, connection.build_url(url).to_s, params, merged_headers, body
          )

          result =
            connection.send(method) do |request|
              request.url(url)
              request.params = params
              request.headers = merged_headers
              request.body = body if body
            end

          build_response(request, result.status, result.headers, result.body)
        end

        def multipart_connection
          @request_class.new(url: @base_url) do |conn|
            conn.use Flash::Integration::MultipartFlat
            conn.request :url_encoded
            conn.adapter @request_class.default_adapter
          end
        end

        def build_request(method, url, params, headers, body)
          Flash::Integration::Request.new(
            method:,
            url:,
            params:,
            headers:,
            body:,
            time: Time.now.utc
          )
        end

        def build_response(request, status, headers, body)
          Flash::Integration::Response.new(
            request:,
            status:,
            headers:,
            body:,
            time: Time.now.utc
          )
        end
    end
  end
end
