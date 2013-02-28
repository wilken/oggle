require "watch/version"
require 'sinatra/base'
require 'sinatra-websocket'

module Watch 
	class App < Sinatra::Base
		configure do
	  		EM.next_tick {
	  			p "#{settings.servers} goog"
	  		}
		end

		get '/' do
    		erb :index
		end
	end
end