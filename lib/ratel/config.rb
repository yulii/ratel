require 'active_support/configurable'

module Ratel
  # Configures global settings for Ratel
  #   Ratel.configure do |config|
  #     config.tracking = :google_analytics
  #   end
  def self.configure(&block)
    yield @config ||= Ratel::Configuration.new
  end

  def self.config
    @config
  end

  class Configuration #:nodoc:
    include ActiveSupport::Configurable
    config_accessor :screen_key
    config_accessor :tracking

    def param_name
      config.param_name.respond_to?(:call) ? config.param_name.call : config.param_name
    end

    # define param_name writer (copied from AS::Configurable)
    writer, line = 'def param_name=(value); config.param_name = value; end', __LINE__
    singleton_class.class_eval writer, __FILE__, line
    class_eval writer, __FILE__, line
  end

  configure do |config|
    config.screen_key = :_screen_key_
    config.tracking   = :google_analytics
  end
end
