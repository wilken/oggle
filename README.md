# Oggle

Oggle is a simple tool to monitor servers. Just point it to a YAML file containing a list of servers and words to check for, and Oggle will monitor the servers uptime and show it on a webpage.

## Installation

	gem install oggle


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
