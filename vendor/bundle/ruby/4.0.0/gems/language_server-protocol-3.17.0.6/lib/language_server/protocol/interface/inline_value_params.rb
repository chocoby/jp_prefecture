module LanguageServer
  module Protocol
    module Interface
      #
      # A parameter literal used in inline value requests.
      #
      # @since 3.17.0
      #
      class InlineValueParams
        def initialize(text_document:, range:, context:, work_done_token: nil)
          @attributes = {}

          @attributes[:textDocument] = text_document
          @attributes[:range] = range
          @attributes[:context] = context
          @attributes[:workDoneToken] = work_done_token if work_done_token

          @attributes.freeze
        end

        #
        # The text document.
        #
        # @return [TextDocumentIdentifier]
        def text_document
          attributes.fetch(:textDocument)
        end

        #
        # The document range for which inline values should be computed.
        #
        # @return [Range]
        def range
          attributes.fetch(:range)
        end

        #
        # Additional information about the context in which inline values were
        # requested.
        #
        # @return [InlineValueContext]
        def context
          attributes.fetch(:context)
        end

        #
        # An optional token that a server can use to report work done progress.
        #
        # @return [ProgressToken]
        def work_done_token
          attributes.fetch(:workDoneToken)
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
