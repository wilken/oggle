require 'sinatra'
require 'thor'
require 'watch'

class CLI < Thor
  desc "start", "Start the watch server."
  def start(filename=nil)
  	$servers= {server:'foo'}
  end
end

 run 	Watch::App.new
CLI.start(ARGV)