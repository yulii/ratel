module Ratel
  class Engine < ::Rails::Engine
    initializer :ratel do |app|
      ActionView::Base.send :include, Ratel::ActionViewExtension
    end
  end
end
