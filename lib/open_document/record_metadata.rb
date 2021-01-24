# frozen_string_literal: true

module OpenDocument
  class RecordMetadata
    def initialize(attributes = {})
      @attributes = attributes
    end

    def method_missing(m, *args, &block)
      return metadata_attribute(m) if @attributes[m]

      super
    end

    private

    def metadata_attribute(method)
      define_singleton_method(method) { @attributes[method] }
      send method
    end
  end
end
