module LanguageServer
  module Protocol
    module Interface
      #
      # Client capabilities specific to the used markdown parser.
      #
      # @since 3.16.0
      #
      class MarkdownClientCapabilities
        def initialize(parser:, version: nil, allowed_tags: nil)
          @attributes = {}

          @attributes[:parser] = parser
          @attributes[:version] = version if version
          @attributes[:allowedTags] = allowed_tags if allowed_tags

          @attributes.freeze
        end

        #
        # The name of the parser.
        #
        # @return [string]
        def parser
          attributes.fetch(:parser)
        end

        #
        # The version of the parser.
        #
        # @return [string]
        def version
          attributes.fetch(:version)
        end

        #
        # A list of HTML tags that the client allows / supports in
        # Markdown.
        #
        # @since 3.17.0
        #
        # @return [string[]]
        def allowed_tags
          attributes.fetch(:allowedTags)
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
