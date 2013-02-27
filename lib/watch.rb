require "watch/version"
require 'sinatra'
require 'sinatra/base'

enable :run
get "/" do
	erb :index
end
