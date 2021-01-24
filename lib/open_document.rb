# frozen_string_literal: true

require 'mongoid'

require './lib/open_document/record_metadata'
require './lib/open_document/api'
require './lib/open_document/record'

Mongoid.load!(File.open('./config/mongoid.yml'))
