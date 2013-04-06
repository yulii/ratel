# encoding: utf-8
require 'rubygems'
require 'rails_spec_app'
require 'ratel'

require 'capybara/rails'
RSpec.configure do |config|
  config.mock_with :rspec
  config.include Capybara::DSL
end
