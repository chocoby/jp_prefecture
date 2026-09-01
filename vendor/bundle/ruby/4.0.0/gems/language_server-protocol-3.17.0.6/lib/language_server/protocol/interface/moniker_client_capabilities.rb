module LanguageServer
  module Protocol
    module Interface
      #
      # Client capabilities specific to the moniker request.
      #
      # @since 3.16.0
      #
      class MonikerClientCapabilities
        def initialize(dynamic_registration: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration if dynamic_registration

          @attributes.freeze
        end

        #
        # Whether moniker supports dynamic registration. If this is set to `true`
        # the client supports the new `MonikerRegistrationOptions` return value
        # for the corresponding server capability as well.
        #
        # @return [boolean]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
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
