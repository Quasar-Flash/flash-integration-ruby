# frozen_string_literal: true

require "spec_helper"
require "flash_integration"

RSpec.describe Flash::Integration do
  describe ".configure" do
    before do
      described_class.configuration = nil
      ENV.clear
    end

    subject { described_class.configuration }

    context "when configuration is defined" do
      before do
        described_class.configure do |config|
        end
      end

      it { expect(subject).not_to be_nil }
    end
  end
end
