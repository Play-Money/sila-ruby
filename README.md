# sila-ruby
Actively maintained successor to https://rubygems.org/gems/sila-ruby

A simple Ruby gem for the Sila API protocol.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sila-ruby'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sila-ruby

## Usage

### Load the gem
```
require 'sila-ruby'
```

### Setup your Sila API keys

```
SilaRuby.setup do |config|
  config.handle = 'SILA_HANDLE'
  config.address = 'SILA_ADDRESS'
  config.private_key = "SILA_PRIVATE_KEY"
end
```

### Use the gem

The gem methods are named after the official Sila API Documentation: https://docs.silamoney.com/?plaintext#endpoints
