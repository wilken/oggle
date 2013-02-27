require "watch/version"
require 'sinatra'

module Watch
	class App < Sinatra::Base
		get "/" do
			erb :index
		end
	end
end
