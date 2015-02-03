require 'bundler/setup'
Bundler.setup

require 'sinatra'
require 'firudo'
require 'rack/test'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
# DEPENDENCIES
%w( sinatra/base fileutils ).each {|lib| require lib }

## SINATRA EXTENSIONS
%w( logger ).each {|ext| require ext }

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  # some (optional) config here
end

def fixtures_path
  "#{File.dirname(File.expand_path(__FILE__))}/fixtures"
end
