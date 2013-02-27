require 'thor'
require 'pry'

class CLI < Thor
  desc "start", "Start the watch server."
  option :port
  def start(filename=nil)
  	binding.pry
  	p options
  	set :port, options[:port] if options[:port]
	enable :run 
  end
end