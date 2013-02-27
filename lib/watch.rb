require "watch/version"
require 'sinatra'
require 'sinatra/base'

enable :run if __FILE__ == $0

set :root,  File.expand_path('..', __FILE__)
set :views, 'views'
get "/" do
	erb :index
end
