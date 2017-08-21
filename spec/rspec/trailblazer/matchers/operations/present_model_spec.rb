require 'spec_helper'

RSpec.describe RSpec::Trailblazer::Matchers::Operations::PresentModel, type: :operation do

  let(:result) { double('operation_result') }
  let(:actual_model) { double('actual_model') }
  let(:expected_model) { double('expected_model') }

  # --------------------------------------------------------------------------------------------------------------------
  describe '#description' do
    it 'provides a description' do
      expect(present_model(expected_model).description).to match("present the model #{double_as_string('expected_model')}")
    end
  end

  # --------------------------------------------------------------------------------------------------------------------
  context 'when the actual model is equal to the expected one' do
    before(:each) do
      allow(result).to receive(:[]).with('model').and_return(actual_model)
    end

    it 'the presented model is the expected one' do
      expect(result).to present_model(actual_model)
    end
  end

  # --------------------------------------------------------------------------------------------------------------------
  context 'when the actual model is not equal to the expected one' do

    before(:each) do
      allow(result).to receive(:[]).with('model').and_return(actual_model)
    end

    it 'the presented model is not the expected one' do
      expect(result).to_not present_model(expected_model)
    end

    it 'provides a failure message' do
      matcher = present_model(expected_model)
      matcher.matches?(result)
      message = "expected: #{double_as_string('expected_model')}\n"
      message << "     got: #{double_as_string('actual_model')}"
      expect(matcher.failure_message).to match(message)
    end
  end

  # --------------------------------------------------------------------------------------------------------------------
  context 'when the actual model is undefined' do

    before(:each) do
      allow(result).to receive(:[]).with('model').and_return(nil)
    end

    it 'the presented model is not the expected one' do
      expect(result).to_not present_model(expected_model)
    end

    it 'provides a failure message' do
      matcher = present_model(expected_model)
      matcher.matches?(result)
      message = "expected: #{double_as_string('expected_model')}\n"
      message << '     got: nil'
      expect(matcher.failure_message).to match(message)
    end
  end

  # ------------------------------------------------------------------------------------------------------ private -----
  private

  def double_as_string(double_name)
    "#\\[.*Double.*\"#{double_name}\"\\]"
  end

end
