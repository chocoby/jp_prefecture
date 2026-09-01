module LanguageServer
  module Protocol
    module Interface
      #
      # The client capabilities of a {@link DocumentLinkRequest}.
      #
      class DocumentLinkClientCapabilities
        def initialize(dynamic_registration: nil, tooltip_support: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration if dynamic_registration
          @attributes[:tooltipSupport] = tooltip_support if tooltip_support

          @attributes.freeze
        end

        #
        # Whether document link supports dynamic registration.
        #
        # @return [boolean]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
        end

        #
        # Whether the client supports the `tooltip` property on `DocumentLink`.
        #
        # @since 3.15.0
        #
        # @return [boolean]
        def tooltip_support
          attributes.fetch(:tooltipSupport)
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
