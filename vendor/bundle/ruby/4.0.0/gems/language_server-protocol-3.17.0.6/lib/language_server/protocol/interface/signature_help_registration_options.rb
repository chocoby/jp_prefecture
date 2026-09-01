module LanguageServer
  module Protocol
    module Interface
      #
      # Registration options for a {@link SignatureHelpRequest}.
      #
      class SignatureHelpRegistrationOptions
        def initialize(document_selector:, trigger_characters: nil, retrigger_characters: nil, work_done_progress: nil)
          @attributes = {}

          @attributes[:documentSelector] = document_selector
          @attributes[:triggerCharacters] = trigger_characters if trigger_characters
          @attributes[:retriggerCharacters] = retrigger_characters if retrigger_characters
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
        # List of characters that trigger signature help automatically.
        #
        # @return [string[]]
        def trigger_characters
          attributes.fetch(:triggerCharacters)
        end

        #
        # List of characters that re-trigger signature help.
        #
        # These trigger characters are only active when signature help is already showing. All trigger characters
        # are also counted as re-trigger characters.
        #
        # @since 3.15.0
        #
        # @return [string[]]
        def retrigger_characters
          attributes.fetch(:retriggerCharacters)
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
