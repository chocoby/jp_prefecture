module LanguageServer
  module Protocol
    module Interface
      #
      # Inlay hint options used during static registration.
      #
      # @since 3.17.0
      #
      class InlayHintOptions
        def initialize(resolve_provider: nil, work_done_progress: nil)
          @attributes = {}

          @attributes[:resolveProvider] = resolve_provider if resolve_provider
          @attributes[:workDoneProgress] = work_done_progress if work_done_progress

          @attributes.freeze
        end

        #
        # The server provides support to resolve additional
        # information for an inlay hint item.
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
