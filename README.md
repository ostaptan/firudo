# Firudo

[![Gem Version](https://badge.fury.io/rb/firudo.svg)](http://badge.fury.io/rb/firudo)

Provides simple logging into log files (/log/development.log || /log/production.log) and filtering security parameters from logs for Sinatra based applications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'firudo'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install firudo

## Usage

    register Sinatra::Firudo
    Sinatra::Firudo.filter_attributes :password, :token, :password_confirmation, ...

