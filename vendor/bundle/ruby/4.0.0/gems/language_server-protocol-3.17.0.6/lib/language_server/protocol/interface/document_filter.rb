module LanguageServer
  module Protocol
    module Interface
      #
      # A document filter describes a top level text document or
      # a notebook cell document.
      #
      # @since 3.17.0 - proposed support for NotebookCellTextDocumentFilter.
      #
      class DocumentFilter
        def initialize(language: nil, scheme: nil, pattern: nil, notebook: nil)
          @attributes = {}

          @attributes[:language] = language if language
          @attributes[:scheme] = scheme if scheme
          @attributes[:pattern] = pattern if pattern
          @attributes[:notebook] = notebook if notebook

          @attributes.freeze
        end

        #
        # A language id, like `typescript`.
        #
        # --- OR ---
        #
        # A language id like `python`.
        #
        # Will be matched against the language id of the
        # notebook cell document. '*' matches every language.
        #
        # @return [string]
        def language
          attributes.fetch(:language)
        end

        #
        # A Uri {@link Uri.scheme scheme}, like `file` or `untitled`.
        #
        # @return [string]
        def scheme
          attributes.fetch(:scheme)
        end

        #
        # A glob pattern, like `*.{ts,js}`.
        #
        # @return [string]
        def pattern
          attributes.fetch(:pattern)
        end

        #
        # A filter that matches against the notebook
        # containing the notebook cell. If a string
        # value is provided it matches against the
        # notebook type. '*' matches every notebook.
        #
        # @return [string | NotebookDocumentFilter]
        def notebook
          attributes.fetch(:notebook)
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
