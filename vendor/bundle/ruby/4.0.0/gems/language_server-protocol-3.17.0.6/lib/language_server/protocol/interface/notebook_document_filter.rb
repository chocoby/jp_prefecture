module LanguageServer
  module Protocol
    module Interface
      #
      # A notebook document filter denotes a notebook document by
      # different properties. The properties will be match
      # against the notebook's URI (same as with documents)
      #
      # @since 3.17.0
      #
      class NotebookDocumentFilter
        def initialize(notebook_type: nil, scheme: nil, pattern: nil)
          @attributes = {}

          @attributes[:notebookType] = notebook_type if notebook_type
          @attributes[:scheme] = scheme if scheme
          @attributes[:pattern] = pattern if pattern

          @attributes.freeze
        end

        #
        # The type of the enclosing notebook.
        #
        # @return [string]
        def notebook_type
          attributes.fetch(:notebookType)
        end

        #
        # A Uri {@link Uri.scheme scheme}, like `file` or `untitled`.
        #
        # @return [string]
        def scheme
          attributes.fetch(:scheme)
        end

        #
        # A glob pattern.
        #
        # @return [string]
        def pattern
          attributes.fetch(:pattern)
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
