module Ratel
  class Engine < ::Rails::Engine
    initializer :ratel do |app|
      ActionController::Base.send :include, Ratel::ActionViewExtension
    end
  end
end
