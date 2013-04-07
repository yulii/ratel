# Ratel

A/B Testing on Rails

Let's enjoy UX-driven development!

## Supported
- Google Analytics

## Installation

Add this line to your application's Gemfile:

    gem 'ratel'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ratel

## Usage

1. Define the block to switch the multiple patterns (`screen_changes` method)
2. Define the conversion (`screen_conversion` method)

### A/B Testing
Pattern A 50% / Pattern B 30% / Original 20%

    <% screen_changes at: :cassette, to: { a: 50, b: 30 }, with: :reset do |g| %>
    <dl>
      <dt>Selected Group</dt>
      <dd><%= g %></dd>
    </dl>
    <a href="javascript: <%= screen_conversion :cassette, :click, g %>">Conversion!</a>
    <% end %>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## LICENSE
(The MIT License)

Copyright © 2013 yulii. See LICENSE.txt for further details.
