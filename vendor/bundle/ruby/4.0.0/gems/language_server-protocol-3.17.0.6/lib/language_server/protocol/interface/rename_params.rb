module LanguageServer
  module Protocol
    module Interface
      #
      # The parameters of a {@link RenameRequest}.
      #
      class RenameParams
        def initialize(text_document:, position:, new_name:, work_done_token: nil)
          @attributes = {}

          @attributes[:textDocument] = text_document
          @attributes[:position] = position
          @attributes[:newName] = new_name
          @attributes[:workDoneToken] = work_done_token if work_done_token

          @attributes.freeze
        end

        #
        # The document to rename.
        #
        # @return [TextDocumentIdentifier]
        def text_document
          attributes.fetch(:textDocument)
        end

        #
        # The position at which this request was sent.
        #
        # @return [Position]
        def position
          attributes.fetch(:position)
        end

        #
        # The new name of the symbol. If the given name is not valid the
        # request must return a {@link ResponseError} with an
        # appropriate message set.
        #
        # @return [string]
        def new_name
          attributes.fetch(:newName)
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
