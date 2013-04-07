module Ratel
  module Tracking
    class Event

      class << self
        def push category, action, label
          unless self.method_defined? :_push
            case Ratel.config.tracking
            when :google_analytics
              self.extend Ratel::Tracking::GoogleAnalytics
            else
              raise NotImplementedError, "invalid Ratel.config.tracking"
            end
          end
          _push category, action, label
        end
      end
    end
  end
end
