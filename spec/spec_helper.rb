# encoding: utf-8
require 'rubygems'
require 'rails_spec_app'
require 'ratel'

require 'capybara/rails'
RSpec.configure do |config|
  config.mock_with :rspec
  config.expect_with :rspec do |c|
    c.syntax = :expect    # disables `should`
  end
  config.include Capybara::DSL
end
