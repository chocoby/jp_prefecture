module LanguageServer
  module Protocol
    module Interface
      #
      # Parameters for a {@link ColorPresentationRequest}.
      #
      class ColorPresentationParams
        def initialize(text_document:, color:, range:, work_done_token: nil, partial_result_token: nil)
          @attributes = {}

          @attributes[:textDocument] = text_document
          @attributes[:color] = color
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
        # The color to request presentations for.
        #
        # @return [Color]
        def color
          attributes.fetch(:color)
        end

        #
        # The range where the color would be inserted. Serves as a context.
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
