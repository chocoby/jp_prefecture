module LanguageServer
  module Protocol
    module Interface
      #
      # Capabilities relating to events from file operations by the user in the client.
      #
      # These events do not come from the file system, they come from user operations
      # like renaming a file in the UI.
      #
      # @since 3.16.0
      #
      class FileOperationClientCapabilities
        def initialize(dynamic_registration: nil, did_create: nil, will_create: nil, did_rename: nil, will_rename: nil, did_delete: nil, will_delete: nil)
          @attributes = {}

          @attributes[:dynamicRegistration] = dynamic_registration if dynamic_registration
          @attributes[:didCreate] = did_create if did_create
          @attributes[:willCreate] = will_create if will_create
          @attributes[:didRename] = did_rename if did_rename
          @attributes[:willRename] = will_rename if will_rename
          @attributes[:didDelete] = did_delete if did_delete
          @attributes[:willDelete] = will_delete if will_delete

          @attributes.freeze
        end

        #
        # Whether the client supports dynamic registration for file requests/notifications.
        #
        # @return [boolean]
        def dynamic_registration
          attributes.fetch(:dynamicRegistration)
        end

        #
        # The client has support for sending didCreateFiles notifications.
        #
        # @return [boolean]
        def did_create
          attributes.fetch(:didCreate)
        end

        #
        # The client has support for sending willCreateFiles requests.
        #
        # @return [boolean]
        def will_create
          attributes.fetch(:willCreate)
        end

        #
        # The client has support for sending didRenameFiles notifications.
        #
        # @return [boolean]
        def did_rename
          attributes.fetch(:didRename)
        end

        #
        # The client has support for sending willRenameFiles requests.
        #
        # @return [boolean]
        def will_rename
          attributes.fetch(:willRename)
        end

        #
        # The client has support for sending didDeleteFiles notifications.
        #
        # @return [boolean]
        def did_delete
          attributes.fetch(:didDelete)
        end

        #
        # The client has support for sending willDeleteFiles requests.
        #
        # @return [boolean]
        def will_delete
          attributes.fetch(:willDelete)
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
