module LanguageServer
  module Protocol
    module Interface
      #
      # Represents a diagnostic, such as a compiler error or warning. Diagnostic objects
      # are only valid in the scope of a resource.
      #
      class Diagnostic
        def initialize(range:, severity: nil, code: nil, code_description: nil, source: nil, message:, tags: nil, related_information: nil, data: nil)
          @attributes = {}

          @attributes[:range] = range
          @attributes[:severity] = severity if severity
          @attributes[:code] = code if code
          @attributes[:codeDescription] = code_description if code_description
          @attributes[:source] = source if source
          @attributes[:message] = message
          @attributes[:tags] = tags if tags
          @attributes[:relatedInformation] = related_information if related_information
          @attributes[:data] = data if data

          @attributes.freeze
        end

        #
        # The range at which the message applies
        #
        # @return [Range]
        def range
          attributes.fetch(:range)
        end

        #
        # The diagnostic's severity. Can be omitted. If omitted it is up to the
        # client to interpret diagnostics as error, warning, info or hint.
        #
        # @return [DiagnosticSeverity]
        def severity
          attributes.fetch(:severity)
        end

        #
        # The diagnostic's code, which usually appear in the user interface.
        #
        # @return [integer | string]
        def code
          attributes.fetch(:code)
        end

        #
        # An optional property to describe the error code.
        # Requires the code field (above) to be present/not null.
        #
        # @since 3.16.0
        #
        # @return [CodeDescription]
        def code_description
          attributes.fetch(:codeDescription)
        end

        #
        # A human-readable string describing the source of this
        # diagnostic, e.g. 'typescript' or 'super lint'. It usually
        # appears in the user interface.
        #
        # @return [string]
        def source
          attributes.fetch(:source)
        end

        #
        # The diagnostic's message. It usually appears in the user interface
        #
        # @return [string]
        def message
          attributes.fetch(:message)
        end

        #
        # Additional metadata about the diagnostic.
        #
        # @since 3.15.0
        #
        # @return [DiagnosticTag[]]
        def tags
          attributes.fetch(:tags)
        end

        #
        # An array of related diagnostic information, e.g. when symbol-names within
        # a scope collide all definitions can be marked via this property.
        #
        # @return [DiagnosticRelatedInformation[]]
        def related_information
          attributes.fetch(:relatedInformation)
        end

        #
        # A data entry field that is preserved between a `textDocument/publishDiagnostics`
        # notification and `textDocument/codeAction` request.
        #
        # @since 3.16.0
        #
        # @return [LSPAny]
        def data
          attributes.fetch(:data)
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
