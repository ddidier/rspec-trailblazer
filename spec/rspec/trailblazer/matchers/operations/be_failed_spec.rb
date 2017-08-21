require 'spec_helper'

RSpec.describe RSpec::Trailblazer::Matchers::Operations::BeFailed, type: :operation do

  let(:result) { double('operation_result') }

  # --------------------------------------------------------------------------------------------------------------------
  describe '#description' do
    it 'provides a description' do
      expect(be_failed.description).to eq('be failed')
    end
  end

  # --------------------------------------------------------------------------------------------------------------------
  context 'when the operation has failed' do
    before(:each) do
      allow(result).to receive(:failure?).and_return(true)
    end

    it 'the result is failed' do
      expect(result).to be_failed
    end
  end

  # --------------------------------------------------------------------------------------------------------------------
  context 'when the operation has not failed' do
    before(:each) do
      allow(result).to receive(:failure?).and_return(false)
    end

    it 'the result is not failed' do
      expect(result).to_not be_failed
    end

    it 'provides a failure message' do
      matcher = be_failed
      expect(matcher.matches?(result)).to be_falsey
      expect(matcher.failure_message).to eq('expected the operation to have failed')
    end
  end

end
