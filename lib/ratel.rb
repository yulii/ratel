require "ratel/version"

module Ratel
end

require 'ratel/config'
require 'ratel/helper/action_view_extension.rb'
require 'ratel/tracking'

if defined? Rails
  require 'ratel/engine'
end
