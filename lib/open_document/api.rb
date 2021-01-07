# frozen_string_literal: true

require 'sinatra'

module OpenDocument
  class Api < ::Sinatra::Base
    get '/' do
      'Welcome to the Open Document API'
    end
  end
end
