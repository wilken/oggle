require 'sinatra'
require 'thor'
require 'watch'
require 'yaml'

module Watch
	class CLI < Thor
	  desc "start FILE", "Start the watch server watching files in FILE."
	  method_option :port,:aliases => "-p", :desc => "Webserver port"
	  def start(file=nil)
		servers = YAML.load_file(file)
		Watch::App.run!(

	  		port: options[:port]||4567,
			run: false
		)
	  end
	end
end

Watch::CLI.start(ARGV)