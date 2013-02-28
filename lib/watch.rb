require "watch/version"
require 'sinatra/base'
require 'sinatra-websocket'

module Watch 
	class App < Sinatra::Base
		helpers do
			def poll(server)
 				http = EM::HttpRequest.new(server['url'])
			    http.errback { p 'Uh oh'}
      			http.callback {
      				p 'ok'
      			}
      		end
		end
		configure do
	  		EM.next_tick do
	  			p "#{settings.servers} goog"
	  			EM.add_periodic_timer 10 do
	  				poll({url: 'http://eb.dk'})
	  			end  
	  		end
		end
		get '/' do
    		erb :index
		end
	end
end