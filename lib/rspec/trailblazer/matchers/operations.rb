require 'rspec'
require_relative 'operations/be_failed'
require_relative 'operations/be_successful'
require_relative 'operations/present_model'

module RSpec
  module Trailblazer
    module Matchers

      # RSpec matchers for Trailblazer operations.
      module Operations
      end

    end
  end
end

RSpec.configure do |config|
  config.include RSpec::Trailblazer::Matchers::Operations, type: :operation
end
