module LanguageServer
  module Protocol
    module Interface
      #
      # A change describing how to move a `NotebookCell`
      # array from state S to S'.
      #
      # @since 3.17.0
      #
      class NotebookCellArrayChange
        def initialize(start:, delete_count:, cells: nil)
          @attributes = {}

          @attributes[:start] = start
          @attributes[:deleteCount] = delete_count
          @attributes[:cells] = cells if cells

          @attributes.freeze
        end

        #
        # The start oftest of the cell that changed.
        #
        # @return [uinteger]
        def start
          attributes.fetch(:start)
        end

        #
        # The deleted cells
        #
        # @return [uinteger]
        def delete_count
          attributes.fetch(:deleteCount)
        end

        #
        # The new cells, if any
        #
        # @return [NotebookCell[]]
        def cells
          attributes.fetch(:cells)
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
