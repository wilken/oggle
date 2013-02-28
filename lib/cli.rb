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
  	p Watch::App.options
	Watch::App.options.merge!(
  		:run  => false,
  		:env  => :production,
  		:port => option[:port]||8000
	)
	run Watch::App
  end
end

CLI.start(ARGV)