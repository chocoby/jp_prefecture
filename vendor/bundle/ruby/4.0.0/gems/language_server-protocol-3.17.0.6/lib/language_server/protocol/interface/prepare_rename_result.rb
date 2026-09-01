module LanguageServer
  module Protocol
    module Interface
      class PrepareRenameResult
        def initialize(start: nil, end: nil, range: nil, placeholder: nil, default_behavior: nil)
          @attributes = {}

          @attributes[:start] = start if start
          @attributes[:end] = binding.local_variable_get(:end) if binding.local_variable_get(:end)
          @attributes[:range] = range if range
          @attributes[:placeholder] = placeholder if placeholder
          @attributes[:defaultBehavior] = default_behavior if default_behavior

          @attributes.freeze
        end

        #
        # The range's start position.
        #
        # @return [Position]
        def start
          attributes.fetch(:start)
        end

        #
        # The range's end position.
        #
        # @return [Position]
        def end
          attributes.fetch(:end)
        end

        #

        #
        # @return [Range]
        def range
          attributes.fetch(:range)
        end

        #

        #
        # @return [string]
        def placeholder
          attributes.fetch(:placeholder)
        end

        #

        #
        # @return [boolean]
        def default_behavior
          attributes.fetch(:defaultBehavior)
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
