# frozen_string_literal: true

module OpenDocument
  class RecordMetadata
    def initialize(attributes = {})
      @attributes = attributes
    end

    def to_hash
      @attributes
    end

    private

    def method_missing(m, *args, &block)
      return metadata_attribute(m) if @attributes[m]

      super
    end

    def metadata_attribute(method)
      define_singleton_method(method) do
        attribute = @attributes[method]
        return attribute unless attribute.is_a?(Hash)

        self.class.new(attribute)
      end

      attribute = send(method)
    end
  end
end
