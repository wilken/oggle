$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'sinatra'
require 'thor'
require 'oggle'
require 'yaml'

module Oggle
	class CLI < Thor
	  desc "start FILE", "Start the Oggle server watching files in FILE."
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

Oggle::CLI.start(ARGV)