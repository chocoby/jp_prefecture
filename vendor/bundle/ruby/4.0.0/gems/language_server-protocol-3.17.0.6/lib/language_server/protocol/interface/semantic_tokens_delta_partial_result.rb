module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.16.0
      #
      class SemanticTokensDeltaPartialResult
        def initialize(edits:)
          @attributes = {}

          @attributes[:edits] = edits

          @attributes.freeze
        end

        # @return [SemanticTokensEdit[]]
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
