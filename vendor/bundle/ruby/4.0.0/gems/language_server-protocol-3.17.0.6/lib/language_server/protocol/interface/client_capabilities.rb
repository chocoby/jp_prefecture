module LanguageServer
  module Protocol
    module Interface
      #
      # Defines the capabilities provided by the client.
      #
      class ClientCapabilities
        def initialize(workspace: nil, text_document: nil, notebook_document: nil, window: nil, general: nil, experimental: nil)
          @attributes = {}

          @attributes[:workspace] = workspace if workspace
          @attributes[:textDocument] = text_document if text_document
          @attributes[:notebookDocument] = notebook_document if notebook_document
          @attributes[:window] = window if window
          @attributes[:general] = general if general
          @attributes[:experimental] = experimental if experimental

          @attributes.freeze
        end

        #
        # Workspace specific client capabilities.
        #
        # @return [WorkspaceClientCapabilities]
        def workspace
          attributes.fetch(:workspace)
        end

        #
        # Text document specific client capabilities.
        #
        # @return [TextDocumentClientCapabilities]
        def text_document
          attributes.fetch(:textDocument)
        end

        #
        # Capabilities specific to the notebook document support.
        #
        # @since 3.17.0
        #
        # @return [NotebookDocumentClientCapabilities]
        def notebook_document
          attributes.fetch(:notebookDocument)
        end

        #
        # Window specific client capabilities.
        #
        # @return [WindowClientCapabilities]
        def window
          attributes.fetch(:window)
        end

        #
        # General client capabilities.
        #
        # @since 3.16.0
        #
        # @return [GeneralClientCapabilities]
        def general
          attributes.fetch(:general)
        end

        #
        # Experimental client capabilities.
        #
        # @return [LSPAny]
        def experimental
          attributes.fetch(:experimental)
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
