module LanguageServer
  module Protocol
    module Interface
      #
      # The result returned from an initialize request.
      #
      class InitializeResult
        def initialize(capabilities:, server_info: nil)
          @attributes = {}

          @attributes[:capabilities] = capabilities
          @attributes[:serverInfo] = server_info if server_info

          @attributes.freeze
        end

        #
        # The capabilities the language server provides.
        #
        # @return [ServerCapabilities]
        def capabilities
          attributes.fetch(:capabilities)
        end

        #
        # Information about the server.
        #
        # @since 3.15.0
        #
        # @return [{ name: string; version?: string; }]
        def server_info
          attributes.fetch(:serverInfo)
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
