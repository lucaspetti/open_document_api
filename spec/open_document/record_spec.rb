# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OpenDocument::Record do
  let(:subject) { described_class.new }

  it { is_expected.to be_mongoid_document }
  it { is_expected.to be_dynamic_document }
end
