require 'sinatra'

class TestApp < Sinatra::Base

  set :root, "#{File.dirname(File.expand_path(__FILE__))}/../fixtures"
  set :app_dir, "#{File.dirname(File.expand_path(__FILE__))}/../fixtures/app"
  set :public_dir, "#{File.dirname(File.expand_path(__FILE__))}/../fixtures/public"

  enable :raise_errors
  Sinatra::Base.set :environment, :test

  register Sinatra::Firudo
  Sinatra::Firudo.filter_attributes :password, :password_confirmation

  get '/status' do
    login = params[:login]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
  end

end