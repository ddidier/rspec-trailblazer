module RSpec
  module Trailblazer
    module Matchers
      module Operations

        # Ensure that the result of a Trailblazer operation present a given model. This matcher is intended to be used
        # with the result of the operation, i.e. an instance of [Trailblazer::Operation::Result] and test the content
        # of `result['model']`.
        #
        # @example
        #
        #   RSpec.describe MyOperation, type: :operation do
        #     it 'present the expected model' do
        #       my_model = ...
        #       result = MyOperation.call(my_attribute: some_value)
        #       expect(result).to present_model(my_model)
        #       # equivalent to:
        #       expect(result['model']).to eq(my_model)
        #     end
        #   end
        #
        # @param model [Object] the expected model.
        # @return [RSpec::Trailblazer::Matchers::Operations::BeSuccessful]
        #
        def present_model(model)
          PresentModel.new(model)
        end

        # Implements {#present_model}.
        class PresentModel

          # @param model [Object] the expected model.
          def initialize(model)
            super()
            @expected_model = model
          end

          # @param result [Trailblazer::Operation::Result] the result of the operation being tested.
          # @return [Boolean] true if the operation was successful, false otherwise.
          def matches?(result)
            @result = result
            actual_model == @expected_model
          end

          # @return [String] a description of this matcher.
          def description
            "present the model #{@expected_model}"
          end

          # @return [String] details about the failure of this matcher.
          def failure_message
            message = ''
            message << "expected: #{@expected_model}\n"
            message << "     got: #{actual_model || 'nil'}"
            message
          end

          # -------------------------------------------------------------------------------------------- private -----
          private

          # @return [Object] the actual model from the result.
          def actual_model
            @result['model']
          end
        end

      end
    end
  end
end
