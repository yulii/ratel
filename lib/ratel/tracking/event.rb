module Ratel
  module Tracking
    class Event

      class << self
        def push category, action, label
          case Ratel.config.tracking
          when :google_analytics
            self.extend Ratel::Tracking::GoogleAnalytics
          end
          _push category, action, label
        end
      end
    end
  end
end
