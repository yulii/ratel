require "ratel/version"

module Ratel
end

require 'ratel/config'

# Helper
require 'ratel/helper/action_view_extension'

# Tracking
require 'ratel/tracking/google_analytics'

if defined? Rails
  require 'ratel/engine'
end
