require 'thor'
require 'watch'

class CLI < Thor
  desc "start", "Start the watch server."
  def start(filename=nil)
	enable :run
  end
end

CLI.start(ARGV)