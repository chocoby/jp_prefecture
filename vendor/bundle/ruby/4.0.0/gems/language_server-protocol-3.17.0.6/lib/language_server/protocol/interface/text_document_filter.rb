module LanguageServer
  module Protocol
    module Interface
      #
      # A document filter denotes a document by different properties like
      # the {@link TextDocument.languageId language}, the {@link Uri.scheme scheme} of
      # its resource, or a glob-pattern that is applied to the {@link TextDocument.fileName path}.
      #
      # Glob patterns can have the following syntax:
      # - `*` to match one or more characters in a path segment
      # - `?` to match on one character in a path segment
      # - `**` to match any number of path segments, including none
      # - `{}` to group sub patterns into an OR expression. (e.g. `**​/*.{ts,js}` matches all TypeScript and JavaScript files)
      # - `[]` to declare a range of characters to match in a path segment (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
      # - `[!...]` to negate a range of characters to match in a path segment (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)
      #
      # @sample A language filter that applies to typescript files on disk: `{ language: 'typescript', scheme: 'file' }`
      # @sample A language filter that applies to all package.json paths: `{ language: 'json', pattern: '**package.json' }`
      #
      # @since 3.17.0
      #
      class TextDocumentFilter
        def initialize(language: nil, scheme: nil, pattern: nil)
          @attributes = {}

          @attributes[:language] = language if language
          @attributes[:scheme] = scheme if scheme
          @attributes[:pattern] = pattern if pattern

          @attributes.freeze
        end

        #
        # A language id, like `typescript`.
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
