# Firudo

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
    Sinatra::Firudo.filter_attributes alf, :password

  (attribute `alf` is required to pass for now)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/firudo/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
