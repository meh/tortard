#--; end
#          DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
#                  Version 2, December 2004
#
# Copyleft meh. [http://meh.doesntexist.org | meh@paranoici.org]
#
#          DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE
# TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION
#
# 0. You just DO WHAT THE FUCK YOU WANT TO.
#++

require 'eventmachine'
require 'em-socksify'

class Tortard; class Bridge

class Connection
	attr_accessor :bridge, :client

	def connection_completed
		socksify(bridge.from.host, bridge.from.port).callback {
			@client.connected
		}
	end

	def receive_data (data)
		@client.received data
	end
end

end; end
