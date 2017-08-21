module RSpec
  module Trailblazer
    module Matchers
      module Operations

        # Ensure that a Trailblazer operation has failed. This matcher is intended to be used with the result of the
        # operation, i.e. an instance of [Trailblazer::Operation::Result].
        #
        # @example
        #
        #   RSpec.describe MyOperation, type: :operation do
        #     it 'fails for some reason' do
        #       result = MyOperation.call(my_attribute: some_value)
        #       expect(result).to be_failed
        #     end
        #   end
        #
        # @return [RSpec::Trailblazer::Matchers::Operations::BeFailed]
        #
        def be_failed
          BeFailed.new
        end

        # Implements {#be_failed}.
        class BeFailed

          # @param result [Trailblazer::Operation::Result] the result of the operation being tested.
          # @return [Boolean] true if the operation has failed, false otherwise.
          def matches?(result)
            @result = result
            @result.failure?
          end

          # @return [String] a description of this matcher.
          def description
            'be failed'
          end

          # @return [String] details about the failure of this matcher.
          def failure_message
            'expected the operation to have failed'
          end

        end

      end
    end
  end
end
