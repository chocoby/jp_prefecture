module LanguageServer
  module Protocol
    module Interface
      #
      # A range in a text document expressed as (zero-based) start and end positions.
      #
      # If you want to specify a range that contains a line including the line ending
      # character(s) then use an end position denoting the start of the next line.
      # For example:
      # ```ts
      # {
      #     start: { line: 5, character: 23 }
      #     end : { line 6, character : 0 }
      # }
      # ```
      #
      class Range
        def initialize(start:, end:)
          @attributes = {}

          @attributes[:start] = start
          @attributes[:end] = binding.local_variable_get(:end)

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
