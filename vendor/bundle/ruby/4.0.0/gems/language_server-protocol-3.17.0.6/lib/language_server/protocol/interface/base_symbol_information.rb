module LanguageServer
  module Protocol
    module Interface
      #
      # A base for all symbol information.
      #
      class BaseSymbolInformation
        def initialize(name:, kind:, tags: nil, container_name: nil)
          @attributes = {}

          @attributes[:name] = name
          @attributes[:kind] = kind
          @attributes[:tags] = tags if tags
          @attributes[:containerName] = container_name if container_name

          @attributes.freeze
        end

        #
        # The name of this symbol.
        #
        # @return [string]
        def name
          attributes.fetch(:name)
        end

        #
        # The kind of this symbol.
        #
        # @return [SymbolKind]
        def kind
          attributes.fetch(:kind)
        end

        #
        # Tags for this symbol.
        #
        # @since 3.16.0
        #
        # @return [SymbolTag[]]
        def tags
          attributes.fetch(:tags)
        end

        #
        # The name of the symbol containing this symbol. This information is for
        # user interface purposes (e.g. to render a qualifier in the user interface
        # if necessary). It can't be used to re-infer a hierarchy for the document
        # symbols.
        #
        # @return [string]
        def container_name
          attributes.fetch(:containerName)
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
