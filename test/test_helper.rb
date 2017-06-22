require 'simplecov'
SimpleCov.start 'rails' unless ENV['NO_COVERAGE']

require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require "mocha/mini_test"
require 'faker'

# Improved Minitest output (color and progress bar)
require "minitest/reporters"
# Minitest::Reporters.use!(Minitest::Reporters::ProgressReporter.new, ENV, Minitest.backtrace_filter)
# Minitest::Reporters.use!(Minitest::Reporters::SpecReporter.new, ENV, Minitest.backtrace_filter)
Minitest::Reporters.use!(Minitest::Reporters::DefaultReporter.new, ENV, Minitest.backtrace_filter)


class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end
