module LanguageServer
  module Protocol
    module Interface
      class DidChangeConfigurationRegistrationOptions
        def initialize(section: nil)
          @attributes = {}

          @attributes[:section] = section if section

          @attributes.freeze
        end

        # @return [string | string[]]
        def section
          attributes.fetch(:section)
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
