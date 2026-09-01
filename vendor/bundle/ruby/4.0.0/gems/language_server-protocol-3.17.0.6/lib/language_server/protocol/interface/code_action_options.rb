module LanguageServer
  module Protocol
    module Interface
      #
      # Provider options for a {@link CodeActionRequest}.
      #
      class CodeActionOptions
        def initialize(code_action_kinds: nil, resolve_provider: nil, work_done_progress: nil)
          @attributes = {}

          @attributes[:codeActionKinds] = code_action_kinds if code_action_kinds
          @attributes[:resolveProvider] = resolve_provider if resolve_provider
          @attributes[:workDoneProgress] = work_done_progress if work_done_progress

          @attributes.freeze
        end

        #
        # CodeActionKinds that this server may return.
        #
        # The list of kinds may be generic, such as `CodeActionKind.Refactor`, or the server
        # may list out every specific kind they provide.
        #
        # @return [CodeActionKind[]]
        def code_action_kinds
          attributes.fetch(:codeActionKinds)
        end

        #
        # The server provides support to resolve additional
        # information for a code action.
        #
        # @since 3.16.0
        #
        # @return [boolean]
        def resolve_provider
          attributes.fetch(:resolveProvider)
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
