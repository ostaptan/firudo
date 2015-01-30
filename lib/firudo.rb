require "firudo/version"
require 'sinatra/base'

module Sinatra
  module Firudo

    def self.registered(klass)
      @firudo_loaded_in ||= {}
      @klass = klass
      return if @firudo_loaded_in[klass]

      klass.set :alf, lambda { File.join(root, 'log', "#{ENV['RACK_ENV']}.log") }
    end

    def self.filter_attributes(alf, *names)
      @logger ||= ::Logger.new(alf)

      @logger.instance_variable_set(:@params_to_filter, names)
      @logger.instance_eval do
        def write(msg)
          params = msg.split('&')
          @params_to_filter.each do |attr|
            params.each { |el| el.gsub! /#{Regexp.quote(attr)}=([\w]+)\b/, "#{attr}=********" }
          end
          msg = params * '&'
          self.send(:<<, msg)
        end
      end

      @klass.configure do
        @klass.use ::Rack::CommonLogger, @logger
      end
    end
  end
end
