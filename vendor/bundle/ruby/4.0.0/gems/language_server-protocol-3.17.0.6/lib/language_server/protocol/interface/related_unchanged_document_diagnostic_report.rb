module LanguageServer
  module Protocol
    module Interface
      #
      # An unchanged diagnostic report with a set of related documents.
      #
      # @since 3.17.0
      #
      class RelatedUnchangedDocumentDiagnosticReport
        def initialize(related_documents: nil, kind:, result_id:)
          @attributes = {}

          @attributes[:relatedDocuments] = related_documents if related_documents
          @attributes[:kind] = kind
          @attributes[:resultId] = result_id

          @attributes.freeze
        end

        #
        # Diagnostics of related documents. This information is useful
        # in programming languages where code in a file A can generate
        # diagnostics in a file B which A depends on. An example of
        # such a language is C/C++ where marco definitions in a file
        # a.cpp and result in errors in a header file b.hpp.
        #
        # @since 3.17.0
        #
        # @return [DocumentUri => FullDocumentDiagnosticReport | UnchangedDocumentDiagnosticReport]
        def related_documents
          attributes.fetch(:relatedDocuments)
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
