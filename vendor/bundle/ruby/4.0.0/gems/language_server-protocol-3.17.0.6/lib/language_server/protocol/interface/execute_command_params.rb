module LanguageServer
  module Protocol
    module Interface
      #
      # The parameters of a {@link ExecuteCommandRequest}.
      #
      class ExecuteCommandParams
        def initialize(command:, arguments: nil, work_done_token: nil)
          @attributes = {}

          @attributes[:command] = command
          @attributes[:arguments] = arguments if arguments
          @attributes[:workDoneToken] = work_done_token if work_done_token

          @attributes.freeze
        end

        #
        # The identifier of the actual command handler.
        #
        # @return [string]
        def command
          attributes.fetch(:command)
        end

        #
        # Arguments that the command should be invoked with.
        #
        # @return [LSPAny[]]
        def arguments
          attributes.fetch(:arguments)
        end

        #
        # An optional token that a server can use to report work done progress.
        #
        # @return [ProgressToken]
        def work_done_token
          attributes.fetch(:workDoneToken)
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
