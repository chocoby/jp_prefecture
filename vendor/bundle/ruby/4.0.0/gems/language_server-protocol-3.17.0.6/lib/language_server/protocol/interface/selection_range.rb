module LanguageServer
  module Protocol
    module Interface
      #
      # A selection range represents a part of a selection hierarchy. A selection range
      # may have a parent selection range that contains it.
      #
      class SelectionRange
        def initialize(range:, parent: nil)
          @attributes = {}

          @attributes[:range] = range
          @attributes[:parent] = parent if parent

          @attributes.freeze
        end

        #
        # The {@link Range range} of this selection range.
        #
        # @return [Range]
        def range
          attributes.fetch(:range)
        end

        #
        # The parent selection range containing this range. Therefore `parent.range` must contain `this.range`.
        #
        # @return [SelectionRange]
        def parent
          attributes.fetch(:parent)
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
