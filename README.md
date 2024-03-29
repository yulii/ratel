# Ratel
[![Gem Version](https://badge.fury.io/rb/ratel.png)](http://badge.fury.io/rb/ratel)
[![Coverage Status](https://coveralls.io/repos/yulii/ratel/badge.png?branch=master)](https://coveralls.io/r/yulii/ratel)
[![Build Status](https://travis-ci.org/yulii/ratel.png)](https://travis-ci.org/yulii/ratel)

A/B Testing for Rails

Let's enjoy UX-driven development!

## Supported
- Google Analytics

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ratel'
```

And then execute:

```bash
$ bundle
```

Or install it yourself as:

```bash
$ gem install ratel
```

## Usage

1. Define the block to switch the multiple patterns (`screen_changes` method)
2. Define the conversion (`screen_conversion` method)

### A/B Testing
Pattern A 50% / Pattern B 30% / Original 20%

```html+ruby
<% screen_changes at: :cassette, to: { a: 50, b: 30 }, with: :reset do |g| %>
  <dl>
    <dt>Selected Group</dt>
    <dd><%= g %></dd>
  </dl>
  <a href="javascript: <%= screen_conversion :cassette, :click, g %>">Conversion!</a>
<% end %>
```

## Advanced Tips
### Create your own Tracking System
Define the tracking class (`Ratel::Tracking::MyTrackingSystem`) and `push` method.

```bash
$ vi lib/tracking/my_tracking_system.rb
```

```ruby
module Ratel
  module Tracking
    module MyTrackingSystem

      # `args` equals screen_conversion's args
      def push *args
        # options = args.extract_options!
        # ...
      end
     
    end
  end
end
```

Rails Config

```ruby
Ratel.configure do |config|
  config.tracking = :my_tracking_system # snake_case symbol or string
end
```

Execute your method (`Ratel::Tracking::MyTrackingSysmtem.push`) when `screen_conversion` method called.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## LICENSE
(The MIT License)

Copyright © 2013 yulii. See LICENSE.txt for further details.
