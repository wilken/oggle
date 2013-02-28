require 'sinatra'
require 'thor'
require 'watch'

set :run, false

class CLI < Thor
  desc "start", "Start the watch server."
  def start(filename=nil)

  			set :root,  File.expand_path('..', __FILE__)
		set :views, Proc.new { File.join(root, "views") }
		set :server, 'thin'
		set :sockets, []
		set :run, false
		
	Watch::App.run!(
  		servers:{servers:'foo'}
	)
  end
end

CLI.start(ARGV)