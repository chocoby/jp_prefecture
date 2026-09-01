module LanguageServer
  module Protocol
    module Interface
      #
      # Diagnostic options.
      #
      # @since 3.17.0
      #
      class DiagnosticOptions
        def initialize(identifier: nil, inter_file_dependencies:, workspace_diagnostics:, work_done_progress: nil)
          @attributes = {}

          @attributes[:identifier] = identifier if identifier
          @attributes[:interFileDependencies] = inter_file_dependencies
          @attributes[:workspaceDiagnostics] = workspace_diagnostics
          @attributes[:workDoneProgress] = work_done_progress if work_done_progress

          @attributes.freeze
        end

        #
        # An optional identifier under which the diagnostics are
        # managed by the client.
        #
        # @return [string]
        def identifier
          attributes.fetch(:identifier)
        end

        #
        # Whether the language has inter file dependencies meaning that
        # editing code in one file can result in a different diagnostic
        # set in another file. Inter file dependencies are common for
        # most programming languages and typically uncommon for linters.
        #
        # @return [boolean]
        def inter_file_dependencies
          attributes.fetch(:interFileDependencies)
        end

        #
        # The server provides support for workspace diagnostics as well.
        #
        # @return [boolean]
        def workspace_diagnostics
          attributes.fetch(:workspaceDiagnostics)
        end

        # @return [boolean]
        def work_done_progress
          attributes.fetch(:workDoneProgress)
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
