module LanguageServer
  module Protocol
    module Interface
      #
      # Additional details for a completion item label.
      #
      # @since 3.17.0
      #
      class CompletionItemLabelDetails
        def initialize(detail: nil, description: nil)
          @attributes = {}

          @attributes[:detail] = detail if detail
          @attributes[:description] = description if description

          @attributes.freeze
        end

        #
        # An optional string which is rendered less prominently directly after {@link CompletionItem.label label},
        # without any spacing. Should be used for function signatures and type annotations.
        #
        # @return [string]
        def detail
          attributes.fetch(:detail)
        end

        #
        # An optional string which is rendered less prominently after {@link CompletionItem.detail}. Should be used
        # for fully qualified names and file paths.
        #
        # @return [string]
        def description
          attributes.fetch(:description)
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
