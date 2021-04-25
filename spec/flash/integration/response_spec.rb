# frozen_string_literal: true

require "spec_helper"

describe Flash::Integration::Response do
  let(:request) { double("request") }
  let(:instance) { described_class.new(request: request, status: status) }

  describe "#success?" do
    subject { instance.success? }

    context "when the status code is between 200 and 299" do
      let(:status) { 250 }

      it { expect(subject).to be_truthy }
    end

    context "when the status code is not between 200 and 299" do
      let(:status) { 500 }

      it { expect(subject).to be_falsey }
    end
  end

  describe "#error?" do
    subject { instance.error? }

    context "when the status code is between 200 and 299" do
      let(:status) { 250 }

      it { expect(subject).to be_falsey }
    end

    context "when the status code is not between 200 and 299" do
      let(:status) { 500 }

      it { expect(subject).to be_truthy }
    end
  end
end
