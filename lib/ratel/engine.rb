module Ratel
  class Engine < ::Rails::Engine
    initializer :ratel do |app|
      Ratel::Initializer.execute
    end
  end

  class Initializer
    class << self
      def execute
        # include helper methods
        ActionView::Base.send :include, Ratel::ActionViewExtension

        define_tracking_event
      end


      private

      def define_tracking_event
        # auot-define Ratel::Tracking::Event class
        Ratel::Tracking.const_set :Event, Class.new unless Ratel::Tracking.const_defined? :Event
        name = "#{Ratel.config.tracking}".camelize
        
        return if Ratel::Tracking::Event.method_defined? :push
        raise NotImplementedError, "#{name} is invalid. Specify correct Ratel.config.tracking." unless Ratel::Tracking.const_defined? name

        # define method that pushes conversion events
        Ratel::Tracking::Event.extend Ratel::Tracking.const_get name
      end

    end
  end
end
