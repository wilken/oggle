require "watch/version"
require 'sinatra'
require 'sinatra/base'
require 'sinatra-websocket'
require 'pry'

set :root,  File.expand_path('..', __FILE__)
set :views, Proc.new { File.join(root, "views") }
set :server, 'thin'
set :sockets, []

get '/index.html' do
	binding.pry
  if !request.websocket?
  	binding.pry
  	p "#{$servers} goog"
    #erb :index
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
