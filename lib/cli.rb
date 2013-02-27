require 'sinatra'
require 'thor'
require 'watch'

set :run, false

class CLI < Thor
  desc "start", "Start the watch server."
  def start(filename=nil)
  	Watch::App.default_options.merge!(
  		servers:{server:'foo'}
	)
	Watch::App.run!
  end
end

CLI.start(ARGV)