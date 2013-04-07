module Ratel
  module ActionViewExtension

    def screen_changes *args, &block
      options = args.extract_options!
      key = :"#{Ratel.config.screen_key}#{options[:at]}"

      ## TODO A/B テストの停止ロジック
      # redis などのkey-value 対応 or 設定ファイルでの制御？      
      if options[:with] == :reset or cookies[key].nil?
        selected = :default
        bar = 0
        num = Time.now.usec % 100
        options[:to].each do |k,v|
          bar += v
          if num < bar
            selected = k
            break
          end
        end
        cookies.permanent.signed[key] = selected
      end
      block.call cookies.signed[key]
    end

    def screen_conversion category, action, label
      # Ratel::Tracking::Event class is auto-defined
      Ratel::Tracking::Event.push category, action, label
    end

  end
end
