module LanguageServer
  module Protocol
    module Interface
      #
      # A workspace edit represents changes to many resources managed in the workspace. The edit
      # should either provide `changes` or `documentChanges`. If documentChanges are present
      # they are preferred over `changes` if the client can handle versioned document edits.
      #
      # Since version 3.13.0 a workspace edit can contain resource operations as well. If resource
      # operations are present clients need to execute the operations in the order in which they
      # are provided. So a workspace edit for example can consist of the following two changes:
      # (1) a create file a.txt and (2) a text document edit which insert text into file a.txt.
      #
      # An invalid sequence (e.g. (1) delete file a.txt and (2) insert text into file a.txt) will
      # cause failure of the operation. How the client recovers from the failure is described by
      # the client capability: `workspace.workspaceEdit.failureHandling`
      #
      class WorkspaceEdit
        def initialize(changes: nil, document_changes: nil, change_annotations: nil)
          @attributes = {}

          @attributes[:changes] = changes if changes
          @attributes[:documentChanges] = document_changes if document_changes
          @attributes[:changeAnnotations] = change_annotations if change_annotations

          @attributes.freeze
        end

        #
        # Holds changes to existing resources.
        #
        # @return [DocumentUri => TextEdit[]]
        def changes
          attributes.fetch(:changes)
        end

        #
        # Depending on the client capability `workspace.workspaceEdit.resourceOperations` document changes
        # are either an array of `TextDocumentEdit`s to express changes to n different text documents
        # where each text document edit addresses a specific version of a text document. Or it can contain
        # above `TextDocumentEdit`s mixed with create, rename and delete file / folder operations.
        #
        # Whether a client supports versioned document edits is expressed via
        # `workspace.workspaceEdit.documentChanges` client capability.
        #
        # If a client neither supports `documentChanges` nor `workspace.workspaceEdit.resourceOperations` then
        # only plain `TextEdit`s using the `changes` property are supported.
        #
        # @return [TextDocumentEdit | CreateFile | RenameFile | DeleteFile[]]
        def document_changes
          attributes.fetch(:documentChanges)
        end

        #
        # A map of change annotations that can be referenced in `AnnotatedTextEdit`s or create, rename and
        # delete file / folder operations.
        #
        # Whether clients honor this property depends on the client capability `workspace.changeAnnotationSupport`.
        #
        # @since 3.16.0
        #
        # @return [ChangeAnnotationIdentifier => ChangeAnnotation]
        def change_annotations
          attributes.fetch(:changeAnnotations)
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
