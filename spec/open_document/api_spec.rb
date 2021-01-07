# frozen_string_literal: true

require 'spec_helper'

RSpec.describe OpenDocument::Api do
  def app
    OpenDocument::Api
  end

  describe 'GET /' do
    it 'returns a welcome message' do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to eq('Welcome to the Open Document API')
    end
  end
end
