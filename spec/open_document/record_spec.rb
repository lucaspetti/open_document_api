# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OpenDocument::Record do
  let(:subject) { described_class.new(attributes) }
  let(:attributes) { {} }

  it { is_expected.to be_mongoid_document }
  it { is_expected.to be_dynamic_document }

  describe 'instance methods' do
    let(:metadata) { {} }
    let(:attributes) do
      {
        name: '1984',
        author: 'George Orwell',
        type: 'Book',
        metadata: metadata
      }
    end

    it 'applies a method to all fields' do
      expect(subject.name).to eq('1984')
      expect(subject.author).to eq('George Orwell')
      expect(subject.type).to eq('Book')
    end

    describe 'metadata field' do
      let(:metadata) do
        OpenDocument::RecordMetadata.new(
          {
            'publication_year': 1949,
            'pages': 277,
            'main_character': { 'name': 'Winston' }
          }
        )
      end

      it 'applies a method to a nested key within metadata' do
        expect(subject.metadata.publication_year).to eq(1949)
        expect(subject.metadata.pages).to eq(277)
      end

      it 'applies a method to a double-nested key within metadata' do
        expect(subject.metadata.main_character.name).to eq('Winston')
      end
    end
  end
end
