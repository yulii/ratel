module Ratel
  module Tracking
    module GoogleAnalytics

      def push *args
        options = args.extract_options!
        s = "_gaq.push(['_trackEvent', '#{options[:category]||args[0]}', '#{options[:action]||args[1]}', '#{options[:label]||args[2]}'"
        s << ", #{options[:value]}"          if options.key? :value
        s << ", #{options[:noninteraction]}" if options.key? :noninteraction
        s << "]);"
        s.html_safe
      end

    end
  end
end
