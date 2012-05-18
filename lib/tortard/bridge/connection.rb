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

class Tortard; class Bridge

class Connection < EM::Connection
	include EM::Socksify

	attr_accessor :bridge, :client

	def connection_completed
		socksify(bridge.from.host, bridge.from.port).callback {
			if bridge.ssl == :both || bridge.ssl == :internal
				start_tls
			end

			@client.connected
		}.errback {|e|
			Tortard.log "failed to connect to #{bridge.from}"
		}
	end

	def receive_data (data)
		@client.received data
	end

	def send_data (data)
		super
	end

	def unbind
		@client.close_connection_after_writing if @client
	end
end

end; end
