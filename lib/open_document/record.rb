# frozen_string_literal: true

module OpenDocument
  class Record
    include Mongoid::Document
    include Mongoid::Attributes::Dynamic
  end
end
