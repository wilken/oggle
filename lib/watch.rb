require "watch/version"
require 'sinatra'

module Watch
	class App < SInatra::Base
		get "/" do
			erb :index
		end
	end

end
