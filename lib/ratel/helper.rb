module Ratel
  module Helper

    def screen_changes *args, &block
      options = args.extract_options!
      
      s = :_screen_ticket
      u = :_request_usec
      
      session[u] = Time.now.usec
      session[s] ||= {}
      session[s] = {} if options[:with] == :reset
      
      name = options[:at]
      unless session[s].key? name
        bar = 0
        num = session[u] % 100
        options[:to].each do |k,v|
          bar += v
          puts "#####{k}##### #{num} :=: #{bar} #######"
          if num < bar
            session[s][name] = "_#{k}"
            break
          end
        end
      end
      block.call session[s][name] || ''
    end

  end
end
