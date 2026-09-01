module LanguageServer
  module Protocol
    module Interface
      #
      # Options for notifications/requests for user operations on files.
      #
      # @since 3.16.0
      #
      class FileOperationOptions
        def initialize(did_create: nil, will_create: nil, did_rename: nil, will_rename: nil, did_delete: nil, will_delete: nil)
          @attributes = {}

          @attributes[:didCreate] = did_create if did_create
          @attributes[:willCreate] = will_create if will_create
          @attributes[:didRename] = did_rename if did_rename
          @attributes[:willRename] = will_rename if will_rename
          @attributes[:didDelete] = did_delete if did_delete
          @attributes[:willDelete] = will_delete if will_delete

          @attributes.freeze
        end

        #
        # The server is interested in receiving didCreateFiles notifications.
        #
        # @return [FileOperationRegistrationOptions]
        def did_create
          attributes.fetch(:didCreate)
        end

        #
        # The server is interested in receiving willCreateFiles requests.
        #
        # @return [FileOperationRegistrationOptions]
        def will_create
          attributes.fetch(:willCreate)
        end

        #
        # The server is interested in receiving didRenameFiles notifications.
        #
        # @return [FileOperationRegistrationOptions]
        def did_rename
          attributes.fetch(:didRename)
        end

        #
        # The server is interested in receiving willRenameFiles requests.
        #
        # @return [FileOperationRegistrationOptions]
        def will_rename
          attributes.fetch(:willRename)
        end

        #
        # The server is interested in receiving didDeleteFiles file notifications.
        #
        # @return [FileOperationRegistrationOptions]
        def did_delete
          attributes.fetch(:didDelete)
        end

        #
        # The server is interested in receiving willDeleteFiles file requests.
        #
        # @return [FileOperationRegistrationOptions]
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
