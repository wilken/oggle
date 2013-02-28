require "watch/version"
require 'sinatra/base'
require 'sinatra-websocket'

module Watch 
	class App < Sinatra::Base
		configure do
	  		EM.next_tick {
	  			p "#{settings.servers} goog"
	  		}
	  		p EM
	  		EM.add_periodic_timer 10 do
	  			poll({url: 'http://eb.dk'})
	  		end  
		end
		helpers do
			def poll(server)
 				http = EM::HttpRequest.new(server['url'])
			    http.errback { p 'Uh oh'}
      			http.callback {
      				p 'ok'
      			}
      		end
		end
		get '/' do
    		erb :index
		end
	end
end