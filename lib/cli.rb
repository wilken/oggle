require 'sinatra'
require 'thor'
require 'watch'

set :run, false
set :port, 8000

class CLI < Thor
  desc "start FILE", "Start the watch server watching files in FILE."
  method_option :port,:aliases => "-p", :desc => "Webserver port"
  def start(file=nil)
  	p options
	Watch::App.run!(
  		servers:{
  			servers:'foo',
  			port:8000
  		}
	)
  end
end

CLI.start(ARGV)