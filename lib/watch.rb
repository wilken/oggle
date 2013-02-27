require "watch/version"
require 'sinatra/base'
require 'sinatra-websocket'
require 'pry'


module Watch 
	class App < Sinatra::Base
		set :root,  File.expand_path('..', __FILE__)
		set :views, Proc.new { File.join(root, "views") }
		set :server, 'thin'
		set :sockets, []
		set :run, false

		get '/index.html' do
	  		p "#{$servers} goog"
    		erb :index
		end
	end
end