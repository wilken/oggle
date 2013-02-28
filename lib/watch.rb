require "watch/version"
require 'sinatra/base'
require 'sinatra-websocket'
require 'em-http-request'

module Watch 
	class App < Sinatra::Base
		def self.poll(servers)
			servers.each do|server|
				p server
				http = EM::HttpRequest.new(server['url']).get
			    http.errback { p "#{server['url']} down"}
				http.callback {
					p "#{server['url']} ok"
					EM.next_tick { settings.sockets.each{|s| s.send("#{server['url']} ok") } }
				}
			end
		end

      	configure do
	  		EM.next_tick do
	  			p "#{settings.servers} goog"
  				Watch::App.poll(settings.servers)
	  			EM.add_periodic_timer 10 do
	  				Watch::App.poll(settings.servers)
	  			end  
	  		end
		end
		get '/' do
			if !request.websocket?
				erb :index
			else
			    request.websocket do |ws|
			    	ws.onopen do
			        	ws.send("Hello World!")
			        	settings.sockets << ws
			      	end
			      	ws.onmessage do |msg|
			        	EM.next_tick { settings.sockets.each{|s| s.send(msg) } }
			      	end
			      	ws.onclose do
			        	warn("wetbsocket closed")
			        	settings.sockets.delete(ws)
			      	end
			    end
			end
		end
	end
end