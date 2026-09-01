module LanguageServer
  module Protocol
    module Interface
      #
      # @since 3.16.0
      #
      class SemanticTokensOptions
        def initialize(legend:, range: nil, full: nil, work_done_progress: nil)
          @attributes = {}

          @attributes[:legend] = legend
          @attributes[:range] = range if range
          @attributes[:full] = full if full
          @attributes[:workDoneProgress] = work_done_progress if work_done_progress

          @attributes.freeze
        end

        #
        # The legend used by the server
        #
        # @return [SemanticTokensLegend]
        def legend
          attributes.fetch(:legend)
        end

        #
        # Server supports providing semantic tokens for a specific range
        # of a document.
        #
        # @return [boolean | { ; }]
        def range
          attributes.fetch(:range)
        end

        #
        # Server supports providing semantic tokens for a full document.
        #
        # @return [boolean | { delta?: boolean; }]
        def full
          attributes.fetch(:full)
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
