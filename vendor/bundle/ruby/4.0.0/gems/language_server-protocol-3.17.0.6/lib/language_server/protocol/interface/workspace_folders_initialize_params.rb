module LanguageServer
  module Protocol
    module Interface
      class WorkspaceFoldersInitializeParams
        def initialize(workspace_folders: nil)
          @attributes = {}

          @attributes[:workspaceFolders] = workspace_folders if workspace_folders

          @attributes.freeze
        end

        #
        # The workspace folders configured in the client when the server starts.
        #
        # This property is only available if the client supports workspace folders.
        # It can be `null` if the client supports workspace folders but none are
        # configured.
        #
        # @since 3.6.0
        #
        # @return [WorkspaceFolder[]]
        def workspace_folders
          attributes.fetch(:workspaceFolders)
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
