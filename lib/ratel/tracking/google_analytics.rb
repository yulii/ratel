module Ratel
  module Tracking
    module GoogleAnalytics

      def _push category, action, label, options = {}
        s = "_gaq.push(['_trackEvent', '#{category}', '#{action}', '#{label}'"
        s << ", #{options[:value]}"          if options.key? :value
        s << ", #{options[:noninteraction]}" if options.key? :noninteraction
        s << "]);"
        s.html_safe
      end

    end
  end
end
