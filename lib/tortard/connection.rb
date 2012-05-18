#--
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

require 'tortard/connnection'

class Tortard

class Connection
	attr_accessor :bridge

	def connection_completed
		socksify(bridge.map.from.host, bridge.map.port).callback {
			@bridge.connected
		}
	end

	def receive_data (data)
		@bridge.received data
	end
end

end
