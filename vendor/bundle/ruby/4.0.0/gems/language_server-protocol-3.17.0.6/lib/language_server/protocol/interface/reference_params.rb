module LanguageServer
  module Protocol
    module Interface
      #
      # Parameters for a {@link ReferencesRequest}.
      #
      class ReferenceParams
        def initialize(context:, text_document:, position:, work_done_token: nil, partial_result_token: nil)
          @attributes = {}

          @attributes[:context] = context
          @attributes[:textDocument] = text_document
          @attributes[:position] = position
          @attributes[:workDoneToken] = work_done_token if work_done_token
          @attributes[:partialResultToken] = partial_result_token if partial_result_token

          @attributes.freeze
        end

        # @return [ReferenceContext]
        def context
          attributes.fetch(:context)
        end

        #
        # The text document.
        #
        # @return [TextDocumentIdentifier]
        def text_document
          attributes.fetch(:textDocument)
        end

        #
        # The position inside the text document.
        #
        # @return [Position]
        def position
          attributes.fetch(:position)
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
