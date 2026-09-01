module LanguageServer
  module Protocol
    module Interface
      #
      # General client capabilities.
      #
      # @since 3.16.0
      #
      class GeneralClientCapabilities
        def initialize(stale_request_support: nil, regular_expressions: nil, markdown: nil, position_encodings: nil)
          @attributes = {}

          @attributes[:staleRequestSupport] = stale_request_support if stale_request_support
          @attributes[:regularExpressions] = regular_expressions if regular_expressions
          @attributes[:markdown] = markdown if markdown
          @attributes[:positionEncodings] = position_encodings if position_encodings

          @attributes.freeze
        end

        #
        # Client capability that signals how the client
        # handles stale requests (e.g. a request
        # for which the client will not process the response
        # anymore since the information is outdated).
        #
        # @since 3.17.0
        #
        # @return [{ cancel: boolean; retryOnContentModified: string[]; }]
        def stale_request_support
          attributes.fetch(:staleRequestSupport)
        end

        #
        # Client capabilities specific to regular expressions.
        #
        # @since 3.16.0
        #
        # @return [RegularExpressionsClientCapabilities]
        def regular_expressions
          attributes.fetch(:regularExpressions)
        end

        #
        # Client capabilities specific to the client's markdown parser.
        #
        # @since 3.16.0
        #
        # @return [MarkdownClientCapabilities]
        def markdown
          attributes.fetch(:markdown)
        end

        #
        # The position encodings supported by the client. Client and server
        # have to agree on the same position encoding to ensure that offsets
        # (e.g. character position in a line) are interpreted the same on both
        # sides.
        #
        # To keep the protocol backwards compatible the following applies: if
        # the value 'utf-16' is missing from the array of position encodings
        # servers can assume that the client supports UTF-16. UTF-16 is
        # therefore a mandatory encoding.
        #
        # If omitted it defaults to ['utf-16'].
        #
        # Implementation considerations: since the conversion from one encoding
        # into another requires the content of the file / line the conversion
        # is best done where the file is read which is usually on the server
        # side.
        #
        # @since 3.17.0
        #
        # @return [PositionEncodingKind[]]
        def position_encodings
          attributes.fetch(:positionEncodings)
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
