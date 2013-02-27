require "watch/version"
require 'sinatra'
require 'sinatra/base'
require 'sinatra-websocket'
require 'pry'

module Watch 
	class App < Sinatra::Base
		set :root,  File.expand_path('..', __FILE__)
		set :views, Proc.new { File.join(root, "views") }
		set :server, 'thin'
		set :sockets, []
		
		get '/index.html' do
			if !request.websocket?
		  		p "#{$servers} goog"
	    		#erb :index
	  		else
	 			request.websocket do |ws|
	    			ws.onopen do
	        			ws.send("Hello World!")
	        		end
	        		settings.sockets << ws
	        	end
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