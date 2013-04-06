require 'action_controller/railtie'
require 'action_view/railtie'

# config
app = Class.new Rails::Application
app.config.active_support.deprecation = :log
app.config.secret_token = 'xxxxxxxx'
app.config.generators do |g|
  g.template_engine :haml
end
app.initialize!

# routing
app.routes.draw do
  get "/"  =>"index#index"  ,as: :index
end

# controllers
class ApplicationController < ActionController::Base ; end

class IndexController < ApplicationController
end

module ApplicationHelper
  include Ratel::Helper
end
