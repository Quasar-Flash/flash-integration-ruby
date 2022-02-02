# frozen_string_literal: true

require "spec_helper"

describe Flash::Integration::Connection do
  let(:base_url) { "http://localhost" }
  let(:connection) { Faraday::Connection.new(url: base_url) }
  let(:instance) { described_class.new(request_class:, base_url:) }
  let(:request_params) { double("request-params") }
  let(:request_class) { class_double(Faraday, default_adapter: double("request-params")) }
  let(:request_headers) { {} }
  let(:request_body) { double("request-body") }
  let(:response_status) { double("response-status") }
  let(:response_headers) { double("response-headers") }
  let(:response_body) { double("response-body") }
  let(:time) { Time.now.utc }
  let(:multipart) { nil }

  let(:response) do
    double(
      "response",
      request:,
      status: response_status,
      headers: response_headers,
      body: response_body
    )
  end
  let(:request) do
    Flash::Integration::Request.new(
      method: http_protocol,
      url: base_url,
      params: request_params,
      headers: request_headers,
      body: request_body,
      time:
    )
  end

  shared_examples "successful_request" do |http_protocol|
    let(:http_protocol) { http_protocol.to_sym }
    let(:args) { { url: base_url, params: request_params, headers: request_headers, body: request_body } }

    subject { instance.send(http_protocol, **args) }

    before do
      allow(request_class).to receive(:new).and_return(connection)
      allow(connection).to receive(http_protocol).and_return(response)
    end

    it { subject; expect(request_class).to have_received(:new) }

    it { subject; expect(connection).to have_received(http_protocol) }

    it { expect(subject.request).to have_attributes(
      method: http_protocol,
      url: base_url,
      params: request_params,
      headers: request_headers,
      body: request_body)
    }

    it { expect(subject.time).to be_kind_of(Time) }

    it { expect(subject.status).to eq(response_status) }

    it { expect(subject.headers).to eq(response_headers) }

    it { expect(subject.body).to eq(response_body) }

    it { expect(connection.adapter).to eq(Faraday::Adapter::NetHttp) }

    it { expect(connection.builder.handlers).to eq([Faraday::Request::UrlEncoded]) }
  end

  describe "#get" do
    include_examples "successful_request", :get

    let!(:args) { { url: base_url, params: request_params, headers: request_headers } }
    let(:request_body) { {} }
  end

  describe "#post" do
    include_examples "successful_request", :post

    let!(:args) { { url: base_url, params: request_params, headers: request_headers, body: request_body, multipart: true } }
  end

  describe "#put" do
    include_examples "successful_request", :put
  end

  describe "#patch" do
    include_examples "successful_request", :patch
  end

  describe "#delete" do
    include_examples "successful_request", :delete
  end
end
