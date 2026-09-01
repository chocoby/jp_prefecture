module LanguageServer
  module Protocol
    module Interface
      class ColorPresentation
        def initialize(label:, text_edit: nil, additional_text_edits: nil)
          @attributes = {}

          @attributes[:label] = label
          @attributes[:textEdit] = text_edit if text_edit
          @attributes[:additionalTextEdits] = additional_text_edits if additional_text_edits

          @attributes.freeze
        end

        #
        # The label of this color presentation. It will be shown on the color
        # picker header. By default this is also the text that is inserted when selecting
        # this color presentation.
        #
        # @return [string]
        def label
          attributes.fetch(:label)
        end

        #
        # An {@link TextEdit edit} which is applied to a document when selecting
        # this presentation for the color.  When `falsy` the {@link ColorPresentation.label label}
        # is used.
        #
        # @return [TextEdit]
        def text_edit
          attributes.fetch(:textEdit)
        end

        #
        # An optional array of additional {@link TextEdit text edits} that are applied when
        # selecting this color presentation. Edits must not overlap with the main {@link ColorPresentation.textEdit edit} nor with themselves.
        #
        # @return [TextEdit[]]
        def additional_text_edits
          attributes.fetch(:additionalTextEdits)
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
