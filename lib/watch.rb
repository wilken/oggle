require "watch/version"
require 'sinatra/base'
require 'sinatra-websocket'
require 'em-http-request'
require 'json'

module Watch 
	class App < Sinatra::Base
		def self.poll(servers)
			servers.each do|server|
				http = EM::HttpRequest.new(server[1]['url']).get :redirects => 5
			    http.errback do
					EM.next_tick { settings.sockets.each{|s| s.send({
						type:"update", 
						name: server[0], 
						server:{url: server[1]['url'],
						status: "error"
					}}.to_json)}}
			    end
				http.callback do
					status = 'error'
					status = 'ok' if http.response.to_s.include?(server[1]['check'])
					EM.next_tick { settings.sockets.each{|s| s.send({
						type:"update", 
						name: server[0], 
						server:{url: server[1]['url'],
						status: rand(3)==1?'error':'ok'
					}}.to_json)}}
				end
			end
		end

      	configure do
	  		EM.next_tick do
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
			        	ws.send({
			        		type:"init", 
			        		servers: settings.servers
			        	}.to_json)
			        	settings.sockets << ws
			      	end

			      	#ws.onmessage do |msg|
			        #	EM.next_tick { settings.sockets.each{|s| s.send(msg) } }
			      	#end

			      	ws.onclose do
			        	warn("wetbsocket closed")
			        	settings.sockets.delete(ws)
			      	end
			    end
			end
		end
	end
end