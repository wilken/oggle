require "watch/version"
require 'sinatra'
require 'sinatra/base'

module Watch
	class App < Sinatra::Base

		enable :run

		get "/" do
			erb :index
		end
	end
end
