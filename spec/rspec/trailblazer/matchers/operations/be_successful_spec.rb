require 'spec_helper'

RSpec.describe RSpec::Trailblazer::Matchers::Operations::BeSuccessful, type: :operation do

  let(:result) { double('operation_result') }

  # --------------------------------------------------------------------------------------------------------------------
  describe '#description' do
    it 'provides a description' do
      expect(be_successful.description).to eq('be successful')
    end
  end

  # --------------------------------------------------------------------------------------------------------------------
  context 'when the operation is successful' do
    before(:each) do
      allow(result).to receive(:success?).and_return(true)
    end

    it 'the result is successful' do
      expect(result).to be_successful
    end
  end

  # --------------------------------------------------------------------------------------------------------------------
  context 'when the operation is not successful' do
    before(:each) do
      allow(result).to receive(:success?).and_return(false)
    end

    it 'the result is not successful' do
      expect(result).to_not be_successful
    end

    it 'provides a failure message' do
      matcher = be_successful
      expect(matcher.matches?(result)).to be_falsey
      expect(matcher.failure_message).to eq('expected the operation to have succeeded')
    end
  end

end
