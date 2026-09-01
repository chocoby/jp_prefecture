module LanguageServer
  module Protocol
    module Interface
      #
      # The parameters of a {@link DocumentRangeFormattingRequest}.
      #
      class DocumentRangeFormattingParams
        def initialize(text_document:, range:, options:, work_done_token: nil)
          @attributes = {}

          @attributes[:textDocument] = text_document
          @attributes[:range] = range
          @attributes[:options] = options
          @attributes[:workDoneToken] = work_done_token if work_done_token

          @attributes.freeze
        end

        #
        # The document to format.
        #
        # @return [TextDocumentIdentifier]
        def text_document
          attributes.fetch(:textDocument)
        end

        #
        # The range to format
        #
        # @return [Range]
        def range
          attributes.fetch(:range)
        end

        #
        # The format options
        #
        # @return [FormattingOptions]
        def options
          attributes.fetch(:options)
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
