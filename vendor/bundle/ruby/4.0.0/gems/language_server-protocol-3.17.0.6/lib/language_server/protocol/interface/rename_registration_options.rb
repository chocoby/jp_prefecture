module LanguageServer
  module Protocol
    module Interface
      #
      # Registration options for a {@link RenameRequest}.
      #
      class RenameRegistrationOptions
        def initialize(document_selector:, prepare_provider: nil, work_done_progress: nil)
          @attributes = {}

          @attributes[:documentSelector] = document_selector
          @attributes[:prepareProvider] = prepare_provider if prepare_provider
          @attributes[:workDoneProgress] = work_done_progress if work_done_progress

          @attributes.freeze
        end

        #
        # A document selector to identify the scope of the registration. If set to null
        # the document selector provided on the client side will be used.
        #
        # @return [DocumentSelector | nil]
        def document_selector
          attributes.fetch(:documentSelector)
        end

        #
        # Renames should be checked and tested before being executed.
        #
        # @since version 3.12.0
        #
        # @return [boolean]
        def prepare_provider
          attributes.fetch(:prepareProvider)
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
