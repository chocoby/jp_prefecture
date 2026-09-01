module LanguageServer
  module Protocol
    module Interface
      #
      # Workspace specific client capabilities.
      #
      class WorkspaceClientCapabilities
        def initialize(apply_edit: nil, workspace_edit: nil, did_change_configuration: nil, did_change_watched_files: nil, symbol: nil, execute_command: nil, workspace_folders: nil, configuration: nil, semantic_tokens: nil, code_lens: nil, file_operations: nil, inline_value: nil, inlay_hint: nil, diagnostics: nil)
          @attributes = {}

          @attributes[:applyEdit] = apply_edit if apply_edit
          @attributes[:workspaceEdit] = workspace_edit if workspace_edit
          @attributes[:didChangeConfiguration] = did_change_configuration if did_change_configuration
          @attributes[:didChangeWatchedFiles] = did_change_watched_files if did_change_watched_files
          @attributes[:symbol] = symbol if symbol
          @attributes[:executeCommand] = execute_command if execute_command
          @attributes[:workspaceFolders] = workspace_folders if workspace_folders
          @attributes[:configuration] = configuration if configuration
          @attributes[:semanticTokens] = semantic_tokens if semantic_tokens
          @attributes[:codeLens] = code_lens if code_lens
          @attributes[:fileOperations] = file_operations if file_operations
          @attributes[:inlineValue] = inline_value if inline_value
          @attributes[:inlayHint] = inlay_hint if inlay_hint
          @attributes[:diagnostics] = diagnostics if diagnostics

          @attributes.freeze
        end

        #
        # The client supports applying batch edits
        # to the workspace by supporting the request
        # 'workspace/applyEdit'
        #
        # @return [boolean]
        def apply_edit
          attributes.fetch(:applyEdit)
        end

        #
        # Capabilities specific to `WorkspaceEdit`s.
        #
        # @return [WorkspaceEditClientCapabilities]
        def workspace_edit
          attributes.fetch(:workspaceEdit)
        end

        #
        # Capabilities specific to the `workspace/didChangeConfiguration` notification.
        #
        # @return [DidChangeConfigurationClientCapabilities]
        def did_change_configuration
          attributes.fetch(:didChangeConfiguration)
        end

        #
        # Capabilities specific to the `workspace/didChangeWatchedFiles` notification.
        #
        # @return [DidChangeWatchedFilesClientCapabilities]
        def did_change_watched_files
          attributes.fetch(:didChangeWatchedFiles)
        end

        #
        # Capabilities specific to the `workspace/symbol` request.
        #
        # @return [WorkspaceSymbolClientCapabilities]
        def symbol
          attributes.fetch(:symbol)
        end

        #
        # Capabilities specific to the `workspace/executeCommand` request.
        #
        # @return [ExecuteCommandClientCapabilities]
        def execute_command
          attributes.fetch(:executeCommand)
        end

        #
        # The client has support for workspace folders.
        #
        # @since 3.6.0
        #
        # @return [boolean]
        def workspace_folders
          attributes.fetch(:workspaceFolders)
        end

        #
        # The client supports `workspace/configuration` requests.
        #
        # @since 3.6.0
        #
        # @return [boolean]
        def configuration
          attributes.fetch(:configuration)
        end

        #
        # Capabilities specific to the semantic token requests scoped to the
        # workspace.
        #
        # @since 3.16.0.
        #
        # @return [SemanticTokensWorkspaceClientCapabilities]
        def semantic_tokens
          attributes.fetch(:semanticTokens)
        end

        #
        # Capabilities specific to the code lens requests scoped to the
        # workspace.
        #
        # @since 3.16.0.
        #
        # @return [CodeLensWorkspaceClientCapabilities]
        def code_lens
          attributes.fetch(:codeLens)
        end

        #
        # The client has support for file notifications/requests for user operations on files.
        #
        # Since 3.16.0
        #
        # @return [FileOperationClientCapabilities]
        def file_operations
          attributes.fetch(:fileOperations)
        end

        #
        # Capabilities specific to the inline values requests scoped to the
        # workspace.
        #
        # @since 3.17.0.
        #
        # @return [InlineValueWorkspaceClientCapabilities]
        def inline_value
          attributes.fetch(:inlineValue)
        end

        #
        # Capabilities specific to the inlay hint requests scoped to the
        # workspace.
        #
        # @since 3.17.0.
        #
        # @return [InlayHintWorkspaceClientCapabilities]
        def inlay_hint
          attributes.fetch(:inlayHint)
        end

        #
        # Capabilities specific to the diagnostic requests scoped to the
        # workspace.
        #
        # @since 3.17.0.
        #
        # @return [DiagnosticWorkspaceClientCapabilities]
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
