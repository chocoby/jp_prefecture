module LanguageServer
  module Protocol
    module Interface
      #
      # The publish diagnostic notification's parameters.
      #
      class PublishDiagnosticsParams
        def initialize(uri:, version: nil, diagnostics:)
          @attributes = {}

          @attributes[:uri] = uri
          @attributes[:version] = version if version
          @attributes[:diagnostics] = diagnostics

          @attributes.freeze
        end

        #
        # The URI for which diagnostic information is reported.
        #
        # @return [DocumentUri]
        def uri
          attributes.fetch(:uri)
        end

        #
        # Optional the version number of the document the diagnostics are published for.
        #
        # @since 3.15.0
        #
        # @return [integer]
        def version
          attributes.fetch(:version)
        end

        #
        # An array of diagnostic information items.
        #
        # @return [Diagnostic[]]
        def diagnostics
          attributes.fetch(:diagnostics)
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
