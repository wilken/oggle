require "watch/version"
require 'sinatra'
require 'sinatra/base'

enable :run
set :root, '..'
get "/" do
	erb :index
end
