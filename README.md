# Oggle

Oggle is a simple tool to monitor servers. Just point it to a YAML file containing a list of servers and words to check for, and Oggle will monitor the servers uptime and show it on a webpage.

## Installation

	gem install oggle

## Installing on Windows
To install Oggle on windows, install the DevKit (http://rubyforge.org/frs/download.php/76805/DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe) and run the
	<installed_dir>ruby dk.rb init
	<installed_dir>ruby dk.rb install

before installation.


## Usage

	oggle start [--port <port>] <file.yaml> 

## File format

	servers:
		<servername>:
			url:<url>
			check:<string to check response for>
		...

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
