module LanguageServer
  module Protocol
    module Interface
      #
      # Client capabilities for the showDocument request.
      #
      # @since 3.16.0
      #
      class ShowDocumentClientCapabilities
        def initialize(support:)
          @attributes = {}

          @attributes[:support] = support

          @attributes.freeze
        end

        #
        # The client has support for the showDocument
        # request.
        #
        # @return [boolean]
        def support
          attributes.fetch(:support)
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
