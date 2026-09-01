module LanguageServer
  module Protocol
    module Interface
      #
      # A previous result id in a workspace pull request.
      #
      # @since 3.17.0
      #
      class PreviousResultId
        def initialize(uri:, value:)
          @attributes = {}

          @attributes[:uri] = uri
          @attributes[:value] = value

          @attributes.freeze
        end

        #
        # The URI for which the client knowns a
        # result id.
        #
        # @return [DocumentUri]
        def uri
          attributes.fetch(:uri)
        end

        #
        # The value of the previous result id.
        #
        # @return [string]
        def value
          attributes.fetch(:value)
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
