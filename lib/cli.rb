require 'sinatra'
require 'thor'
require 'watch'
require 'yaml'

module Watch
	class CLI < Thor
	  desc "start FILE", "Start the watch server watching files in FILE."
	  method_option :port,:aliases => "-p", :desc => "Webserver port"
	  def start(file)
		servers = YAML.load_file(file)
		Watch::App.run!(
			servers: servers['servers'],
	  		port: options[:port]||4567,
			run: false,
			server: 'thin',
			sockets: [],
			root: Proc.new { File.join(File.dirname(__FILE__), "..") }
		)
	  end
	end
end

Watch::CLI.start(ARGV)