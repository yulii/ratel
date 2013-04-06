require 'action_controller/railtie'
require 'action_view/railtie'

# config
app = Class.new Rails::Application
app.config.active_support.deprecation = :log
app.config.secret_token = "e65e0140352e39703c113b0ce30335e8"
app.config.generators do |g|
  g.template_engine :haml
end
app.initialize!

# routing
app.routes.draw do
  get "/"  =>"ratel#index"  ,as: :index
end

# controllers
class ApplicationController < ActionController::Base ; end

class RatelController < ApplicationController
  def index

  end
end

# helpers
Object.const_set(:ApplicationHelper, Module.new)
