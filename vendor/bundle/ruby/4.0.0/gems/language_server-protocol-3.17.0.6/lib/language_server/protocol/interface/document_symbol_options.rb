module LanguageServer
  module Protocol
    module Interface
      #
      # Provider options for a {@link DocumentSymbolRequest}.
      #
      class DocumentSymbolOptions
        def initialize(label: nil, work_done_progress: nil)
          @attributes = {}

          @attributes[:label] = label if label
          @attributes[:workDoneProgress] = work_done_progress if work_done_progress

          @attributes.freeze
        end

        #
        # A human-readable string that is shown when multiple outlines trees
        # are shown for the same document.
        #
        # @since 3.16.0
        #
        # @return [string]
        def label
          attributes.fetch(:label)
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
