module LanguageServer
  module Protocol
    module Interface
      #
      # An unchanged document diagnostic report for a workspace diagnostic result.
      #
      # @since 3.17.0
      #
      class WorkspaceUnchangedDocumentDiagnosticReport
        def initialize(uri:, version:, kind:, result_id:)
          @attributes = {}

          @attributes[:uri] = uri
          @attributes[:version] = version
          @attributes[:kind] = kind
          @attributes[:resultId] = result_id

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
        # The version number for which the diagnostics are reported.
        # If the document is not marked as open `null` can be provided.
        #
        # @return [integer | nil]
        def version
          attributes.fetch(:version)
        end

        #
        # A document diagnostic report indicating
        # no changes to the last result. A server can
        # only return `unchanged` if result ids are
        # provided.
        #
        # @return ["unchanged"]
        def kind
          attributes.fetch(:kind)
        end

        #
        # A result id which will be sent on the next
        # diagnostic request for the same document.
        #
        # @return [string]
        def result_id
          attributes.fetch(:resultId)
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
