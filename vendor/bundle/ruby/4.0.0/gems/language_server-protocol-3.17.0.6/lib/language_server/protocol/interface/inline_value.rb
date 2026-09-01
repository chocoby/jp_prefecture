module LanguageServer
  module Protocol
    module Interface
      #
      # Inline value information can be provided by different means:
      # - directly as a text value (class InlineValueText).
      # - as a name to use for a variable lookup (class InlineValueVariableLookup)
      # - as an evaluatable expression (class InlineValueEvaluatableExpression)
      # The InlineValue types combines all inline value types into one type.
      #
      # @since 3.17.0
      #
      class InlineValue
        def initialize(range:, text: nil, variable_name: nil, case_sensitive_lookup: nil, expression: nil)
          @attributes = {}

          @attributes[:range] = range
          @attributes[:text] = text if text
          @attributes[:variableName] = variable_name if variable_name
          @attributes[:caseSensitiveLookup] = case_sensitive_lookup if case_sensitive_lookup
          @attributes[:expression] = expression if expression

          @attributes.freeze
        end

        #
        # The document range for which the inline value applies.
        #
        # --- OR ---
        #
        # The document range for which the inline value applies.
        # The range is used to extract the variable name from the underlying document.
        #
        # --- OR ---
        #
        # The document range for which the inline value applies.
        # The range is used to extract the evaluatable expression from the underlying document.
        #
        # @return [Range]
        def range
          attributes.fetch(:range)
        end

        #
        # The text of the inline value.
        #
        # @return [string]
        def text
          attributes.fetch(:text)
        end

        #
        # If specified the name of the variable to look up.
        #
        # @return [string]
        def variable_name
          attributes.fetch(:variableName)
        end

        #
        # How to perform the lookup.
        #
        # @return [boolean]
        def case_sensitive_lookup
          attributes.fetch(:caseSensitiveLookup)
        end

        #
        # If specified the expression overrides the extracted expression.
        #
        # @return [string]
        def expression
          attributes.fetch(:expression)
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
