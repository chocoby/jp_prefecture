module LanguageServer
  module Protocol
    module Interface
      #
      # A text document identifier to denote a specific version of a text document.
      #
      class VersionedTextDocumentIdentifier
        def initialize(version:, uri:)
          @attributes = {}

          @attributes[:version] = version
          @attributes[:uri] = uri

          @attributes.freeze
        end

        #
        # The version number of this document.
        #
        # @return [integer]
        def version
          attributes.fetch(:version)
        end

        #
        # The text document's uri.
        #
        # @return [DocumentUri]
        def uri
          attributes.fetch(:uri)
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
