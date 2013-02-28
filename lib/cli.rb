require 'sinatra'
require 'thor'
require 'watch'

set :run, false

class CLI < Thor
  desc "start", "Start the watch server."
  option :port
  def start(filename=nil)
	Watch::App.run!(
  		servers:{
  			servers:'foo',
  			port:options[:port]||4567
  		}
	)
  end
end

CLI.start(ARGV)