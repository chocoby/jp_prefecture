module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.16.0
      #
      class SemanticTokensRangeParams
        def initialize(text_document:, range:, work_done_token: nil, partial_result_token: nil)
          @attributes = {}

          @attributes[:textDocument] = text_document
          @attributes[:range] = range
          @attributes[:workDoneToken] = work_done_token if work_done_token
          @attributes[:partialResultToken] = partial_result_token if partial_result_token

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
        # The range the semantic tokens are requested for.
        #
        # @return [Range]
        def range
          attributes.fetch(:range)
        end

        #
        # An optional token that a server can use to report work done progress.
        #
        # @return [ProgressToken]
        def work_done_token
          attributes.fetch(:workDoneToken)
        end

        #
        # An optional token that a server can use to report partial results (e.g. streaming) to
        # the client.
        #
        # @return [ProgressToken]
        def partial_result_token
          attributes.fetch(:partialResultToken)
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
