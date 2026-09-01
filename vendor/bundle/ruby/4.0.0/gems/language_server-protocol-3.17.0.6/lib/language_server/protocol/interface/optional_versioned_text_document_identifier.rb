module LanguageServer
  module Protocol
    module Interface
      #
      # A text document identifier to optionally denote a specific version of a text document.
      #
      class OptionalVersionedTextDocumentIdentifier
        def initialize(version:, uri:)
          @attributes = {}

          @attributes[:version] = version
          @attributes[:uri] = uri

          @attributes.freeze
        end

        #
        # The version number of this document. If a versioned text document identifier
        # is sent from the server to the client and the file is not open in the editor
        # (the server has not received an open notification before) the server can send
        # `null` to indicate that the version is unknown and the content on disk is the
        # truth (as specified with document content ownership).
        #
        # @return [integer | nil]
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
