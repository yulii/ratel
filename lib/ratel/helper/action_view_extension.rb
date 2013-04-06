module Ratel
  module ActionViewExtension

    def screen_changes *args, &block
      options = args.extract_options!
      
      s = :_screen_ticket

      session[s] ||= {}
      session[s] = {} if options[:with] == :reset
      
      name = options[:at]
      unless session[s].key? name
        bar = 0
        num = Time.now.usec % 100
        options[:to].each do |k,v|
          bar += v
          if num < bar
            session[s][name] = "_#{k}"
            break
          end
        end
      end
      block.call session[s][name] || ''
    end

    def screen_conversion category, action, label
      Ratel::Tracking::Event.push category, action, label
    end

  end
end
