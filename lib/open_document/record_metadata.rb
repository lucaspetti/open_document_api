# frozen_string_literal: true

module OpenDocument
  class RecordMetadata
    attr_reader :attributes

    def initialize(attributes = {})
      @attributes = attributes
    end

    def mongoize
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

    class << self

      def demongoize(object)
        new(object.to_h)
      end

      def mongoize(object)
        case object
        when OpenDocument::RecordMetadata then object.mongoize
        when Hash then new(object.to_h).mongoize
        else object
        end
      end

      def evolve(object)
        case object
        when OpenDocument::RecordMetadata then object.mongoize
        else object
        end
      end
    end
  end
end
