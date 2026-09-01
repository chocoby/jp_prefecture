module LanguageServer
  module Protocol
    module Interface
      #
      # Describe options to be used when registered for text document change events.
      #
      class TextDocumentChangeRegistrationOptions
        def initialize(sync_kind:, document_selector:)
          @attributes = {}

          @attributes[:syncKind] = sync_kind
          @attributes[:documentSelector] = document_selector

          @attributes.freeze
        end

        #
        # How documents are synced to the server.
        #
        # @return [TextDocumentSyncKind]
        def sync_kind
          attributes.fetch(:syncKind)
        end

        #
        # A document selector to identify the scope of the registration. If set to null
        # the document selector provided on the client side will be used.
        #
        # @return [DocumentSelector | nil]
        def document_selector
          attributes.fetch(:documentSelector)
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
