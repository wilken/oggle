require "watch/version"
require 'sinatra/base'
require 'sinatra-websocket'
require 'pry'


module Watch 
	class App < Sinatra::Base


		get '/' do
	  		p "#{settings.servers} goog"
    		erb :index
		end
	end
end