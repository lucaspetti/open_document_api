require './lib/open_document'

run Rack::URLMap.new('/' => OpenDocument::Api)