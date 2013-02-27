require "watch/version"
require 'sinatra'
require 'sinatra/base'

enable :run
set :views,  File.expand_path('../views', __FILE__)

get "/" do
	erb :index
end
