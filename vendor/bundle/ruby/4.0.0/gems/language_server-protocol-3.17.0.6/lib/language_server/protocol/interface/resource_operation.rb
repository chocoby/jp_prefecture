module LanguageServer
  module Protocol
    module Interface
      #
      # A generic resource operation.
      #
      class ResourceOperation
        def initialize(kind:, annotation_id: nil)
          @attributes = {}

          @attributes[:kind] = kind
          @attributes[:annotationId] = annotation_id if annotation_id

          @attributes.freeze
        end

        #
        # The resource operation kind.
        #
        # @return [string]
        def kind
          attributes.fetch(:kind)
        end

        #
        # An optional annotation identifier describing the operation.
        #
        # @since 3.16.0
        #
        # @return [ChangeAnnotationIdentifier]
        def annotation_id
          attributes.fetch(:annotationId)
        end

        attr_reader :attributes

        def to_hash
          attributes
        end

        def to_json(*args)
          to_hash.to_json(*args)
        end
      end
    end
  end
end
