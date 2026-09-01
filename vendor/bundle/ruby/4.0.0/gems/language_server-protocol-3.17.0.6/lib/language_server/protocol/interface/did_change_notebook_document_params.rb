module LanguageServer
  module Protocol
    module Interface
      #
      # The params sent in a change notebook document notification.
      #
      # @since 3.17.0
      #
      class DidChangeNotebookDocumentParams
        def initialize(notebook_document:, change:)
          @attributes = {}

          @attributes[:notebookDocument] = notebook_document
          @attributes[:change] = change

          @attributes.freeze
        end

        #
        # The notebook document that did change. The version number points
        # to the version after all provided changes have been applied. If
        # only the text document content of a cell changes the notebook version
        # doesn't necessarily have to change.
        #
        # @return [VersionedNotebookDocumentIdentifier]
        def notebook_document
          attributes.fetch(:notebookDocument)
        end

        #
        # The actual changes to the notebook document.
        #
        # The changes describe single state changes to the notebook document.
        # So if there are two changes c1 (at array index 0) and c2 (at array
        # index 1) for a notebook in state S then c1 moves the notebook from
        # S to S' and c2 from S' to S''. So c1 is computed on the state S and
        # c2 is computed on the state S'.
        #
        # To mirror the content of a notebook using change events use the following approach:
        # - start with the same initial content
        # - apply the 'notebookDocument/didChange' notifications in the order you receive them.
        # - apply the `NotebookChangeEvent`s in a single notification in the order
        #   you receive them.
        #
        # @return [NotebookDocumentChangeEvent]
        def change
          attributes.fetch(:change)
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
