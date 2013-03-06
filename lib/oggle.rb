require "oggle/version"
require 'sinatra/base'
require 'sinatra-websocket'
require 'em-http-request'
require 'json'

module Oggle 
	class App < Sinatra::Base
		def self.poll(servers)
			servers.each do|server|
				http = EM::HttpRequest.new(server[1]['url']).get :redirects => 5
			    http.errback do
					EM.next_tick { settings.sockets.each{|s| s.send(create_message(server, 'error').to_json)}}
					server[1]['status'] = 'error'
			    end
				http.callback do
					status = 'error'
					status = 'ok' if http.response.to_s.include?(server[1]['check'])
					status = rand(3)==1?'error':'ok'
					EM.next_tick { settings.sockets.each{|s| s.send(create_message(server, status).to_json)}}
					server[1]['status'] = status
				end
			end
		end

		def self.create_message(server, status)
			{
						type:"update", 
						name: server[0], 
						server:{url: server[1]['url'],
						status: status
			}}
		end

      	configure do
	  		EM.next_tick do
  				Oggle::App.poll(settings.servers)
	  			EM.add_periodic_timer settings.interval||30 do
	  				Oggle::App.poll(settings.servers)
	  			end  
	  		end
		end
		get '/' do
			if !request.websocket?
				erb :index, :locals => {:port => settings.port}
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
			        	warn("websocket closed")
			        	settings.sockets.delete(ws)
			      	end
			    end
			end
		end
	end
end