# spec/spec_helper.rb

require "bundler/setup"   # important so the Gemfile deps are on $LOAD_PATH
require "grade_runner/test_helpers"

RSpec.configure do |config|
  config.include GradeRunner::TestHelpers
end
