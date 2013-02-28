require 'sinatra'
require 'thor'
require 'watch'

set :run, false

class CLI < Thor
  desc "start", "Start the watch server."
  def start(filename=nil)


	Watch::App.run!(
  		servers:{servers:'foo'}
	)
  end
end

CLI.start(ARGV)