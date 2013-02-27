require 'sinatra'
require 'thor'
require 'watch'

set :run, false

class CLI < Thor
  desc "start", "Start the watch server."
  def start(filename=nil)
  	module Watch 
		class App < Sinatra::Base
  			@servers= {server:'foo'}
  		end
  	end
	Watch::App.run!
  end
end

CLI.start(ARGV)