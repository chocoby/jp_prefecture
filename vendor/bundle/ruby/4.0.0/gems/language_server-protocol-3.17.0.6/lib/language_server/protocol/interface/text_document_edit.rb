module LanguageServer
  module Protocol
    module Interface
      #
      # Describes textual changes on a text document. A TextDocumentEdit describes all changes
      # on a document version Si and after they are applied move the document to version Si+1.
      # So the creator of a TextDocumentEdit doesn't need to sort the array of edits or do any
      # kind of ordering. However the edits must be non overlapping.
      #
      class TextDocumentEdit
        def initialize(text_document:, edits:)
          @attributes = {}

          @attributes[:textDocument] = text_document
          @attributes[:edits] = edits

          @attributes.freeze
        end

        #
        # The text document to change.
        #
        # @return [OptionalVersionedTextDocumentIdentifier]
        def text_document
          attributes.fetch(:textDocument)
        end

        #
        # The edits to be applied.
        #
        # @since 3.16.0 - support for AnnotatedTextEdit. This is guarded using a
        # client capability.
        #
        # @return [TextEdit | AnnotatedTextEdit[]]
        def edits
          attributes.fetch(:edits)
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
