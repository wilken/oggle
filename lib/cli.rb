require 'sinatra'
require 'thor'
require 'watch'
require 'yaml'

class CLI < Thor
  desc "start FILE", "Start the watch server watching files in FILE."
  method_option :port,:aliases => "-p", :desc => "Webserver port"
  def start(file=nil)
	servers = YAML.load_file(file)
	Watch::App.run!(
  		servers:{
  			servers['servers']
  		},
		port:options[:port]||4567,
		run:false

	)
  end
end

CLI.start(ARGV)