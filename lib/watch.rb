require "watch/version"
require 'sinatra'
require 'sinatra/base'

set :root,  File.expand_path('..', __FILE__)
set :views, Proc.new { File.join(root, "views") }

get "/" do
	erb :index
end
