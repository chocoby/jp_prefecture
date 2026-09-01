module LanguageServer
  module Protocol
    module Interface
      #
      # Represents a reference to a command. Provides a title which
      # will be used to represent a command in the UI and, optionally,
      # an array of arguments which will be passed to the command handler
      # function when invoked.
      #
      class Command
        def initialize(title:, command:, arguments: nil)
          @attributes = {}

          @attributes[:title] = title
          @attributes[:command] = command
          @attributes[:arguments] = arguments if arguments

          @attributes.freeze
        end

        #
        # Title of the command, like `save`.
        #
        # @return [string]
        def title
          attributes.fetch(:title)
        end

        #
        # The identifier of the actual command handler.
        #
        # @return [string]
        def command
          attributes.fetch(:command)
        end

        #
        # Arguments that the command handler should be
        # invoked with.
        #
        # @return [LSPAny[]]
        def arguments
          attributes.fetch(:arguments)
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
