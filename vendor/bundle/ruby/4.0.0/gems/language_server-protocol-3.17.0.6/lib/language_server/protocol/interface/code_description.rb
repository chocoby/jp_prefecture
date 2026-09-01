module LanguageServer
  module Protocol
    module Interface
      #
      # Structure to capture a description for an error code.
      #
      # @since 3.16.0
      #
      class CodeDescription
        def initialize(href:)
          @attributes = {}

          @attributes[:href] = href

          @attributes.freeze
        end

        #
        # An URI to open with more information about the diagnostic error.
        #
        # @return [URI]
        def href
          attributes.fetch(:href)
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
