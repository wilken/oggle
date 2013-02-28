require "watch/version"
require 'sinatra/base'
require 'sinatra-websocket'
require 'em-http-request'

module Watch 
	class App < Sinatra::Base
		configure do

			def poll(server)
 				http = EM::HttpRequest.new(server['url'])
			    http.errback { p 'Uh oh'}
      			http.callback {
      				p 'ok'
      			}
      		end

	  		EM.next_tick do
	  			p "#{settings.servers} goog"
	  			EM.add_periodic_timer 10 do
	  				http = EM::HttpRequest.new('http://eb.dk').get
			    	http.errback { p 'Uh oh'}
      				http.callback {	p 'ok'}
	  			end  
	  		end
		end
		get '/' do
    		erb :index
		end
	end
end