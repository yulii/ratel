# encoding: utf-8
require 'rubygems'
require 'rails_spec_app'
require 'ratel'
require 'coveralls'
require 'capybara/rails'

Coveralls.wear!('rails')
RSpec.configure do |config|
  config.mock_with :rspec
  config.expect_with :rspec do |c|
    c.syntax = :expect    # disables `should`
  end
  config.include Capybara::DSL
end
Capybara.configure do |config|
  config.match = :prefer_exact
  config.ignore_hidden_elements = false
end
