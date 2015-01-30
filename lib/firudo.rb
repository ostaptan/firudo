require "firudo/version"
require 'sinatra/base'

module Sintra
  module Firudo

    def self.registered(klass)
      @firudo_loaded_in ||= {}
      return if @firudo_loaded_in[klass]

      @@access_logger, error_logger = initialize_loggers(klass)

      klass.extend BaseMethods
      klass.before do
        env["rack.errors"] =  error_logger
      end
    end

    def self.logger
      @@access_logger
    end

    def self.initialize_loggers(klass)
      class ::Logger; alias_method :write, :<<; end
      access_log = ::File.join(::File.dirname(::File.expand_path(__FILE__)),'..','log',"#{ENV['RACK_ENV']}.log")
      access_logger = ::Logger.new(access_log)

      error_logger = ::File.new(::File.join(::File.dirname(::File.expand_path(__FILE__)),'..','log','error.log'),"a+")
      error_logger.sync = true
      [access_logger, error_logger]
    end

    module BaseMethods
      def filter_attributes(*names)
        Firudo.logger.instance_eval do
          def write(msg)
            params = msg.split('&')
            names.each do |attr|
              params.each { |el| el.gsub! /#{Regexp.quote(attr)}=([\w]+)\b/, "#{attr}=********" }
            end
            msg = params * '&'
            self.send(:<<, msg)
          end
        end
      end
    end
  end
end
