module LanguageServer
  module Protocol
    module Interface
      #
      # A notebook document.
      #
      # @since 3.17.0
      #
      class NotebookDocument
        def initialize(uri:, notebook_type:, version:, metadata: nil, cells:)
          @attributes = {}

          @attributes[:uri] = uri
          @attributes[:notebookType] = notebook_type
          @attributes[:version] = version
          @attributes[:metadata] = metadata if metadata
          @attributes[:cells] = cells

          @attributes.freeze
        end

        #
        # The notebook document's uri.
        #
        # @return [URI]
        def uri
          attributes.fetch(:uri)
        end

        #
        # The type of the notebook.
        #
        # @return [string]
        def notebook_type
          attributes.fetch(:notebookType)
        end

        #
        # The version number of this document (it will increase after each
        # change, including undo/redo).
        #
        # @return [integer]
        def version
          attributes.fetch(:version)
        end

        #
        # Additional metadata stored with the notebook
        # document.
        #
        # Note: should always be an object literal (e.g. LSPObject)
        #
        # @return [LSPObject]
        def metadata
          attributes.fetch(:metadata)
        end

        #
        # The cells of a notebook.
        #
        # @return [NotebookCell[]]
        def cells
          attributes.fetch(:cells)
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
