require 'sinatra'
require 'thor'
require 'watch'

set :run, false

class CLI < Thor
  desc "start FILE", "Start the watch server watching files in FILE."
  method_option :port,:aliases => "-p", :desc => "Webserver port"
  def start(file=nil)
  	p options
	Watch::App.run!(
  		servers:{
  			servers:'foo',
  			port:options[:port]||4567
  		}
	)
  end
end

CLI.start(ARGV)