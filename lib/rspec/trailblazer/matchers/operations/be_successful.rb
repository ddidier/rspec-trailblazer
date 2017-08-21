module RSpec
  module Trailblazer
    module Matchers
      module Operations

        # Ensure that a Trailblazer operation was successful. This matcher is intended to be used with the result of the
        # operation, i.e. an instance of [Trailblazer::Operation::Result].
        #
        # @example
        #
        #   RSpec.describe MyOperation, type: :operation do
        #     it 'succeeds' do
        #       result = MyOperation.call(my_attribute: some_value)
        #       expect(result).to be_successful
        #     end
        #   end
        #
        # @return [RSpec::Trailblazer::Matchers::Operations::BeSuccessful]
        #
        def be_successful
          BeSuccessful.new
        end

        # Implements {#be_successful}.
        class BeSuccessful

          # @param result [Trailblazer::Operation::Result] the result of the operation being tested.
          # @return [Boolean] true if the operation was successful, false otherwise.
          def matches?(result)
            @result = result
            @result.success?
          end

          # @return [String] a description of this matcher.
          def description
            'be successful'
          end

          # @return [String] details about the failure of this matcher.
          def failure_message
            'expected the operation to have succeeded'
          end

        end

      end
    end
  end
end
