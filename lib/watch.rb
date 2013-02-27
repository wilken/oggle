require "watch/version"
require 'sinatra'
require 'sinatra/base'

module Watch
	class App < Sinatra::Base
		get "/" do
			erb :index
		end
	end
end
