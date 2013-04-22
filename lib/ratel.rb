require "ratel/version"

module Ratel
end

require 'ratel/config'

# Helpers
require 'ratel/helpers/action_view_extension'

# Filters
require 'ratel/filters/referer'

# Tracking
require 'ratel/tracking/google_analytics'

if defined? Rails
  require 'ratel/engine'
end
