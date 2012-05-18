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

class Tortard; class Bridge

class Client < EM::Connection
	attr_accessor :bridge

	def post_init
		@buffer = []
	end

	def connect
		if bridge.ssl == :both || bridge.ssl == :external
			start_tls
		end

		EM.connect bridge.proxy.host, bridge.proxy.port, Connection do |c|
			c.client = self
			c.bridge = bridge

			@connection = c
		end
	end

	def receive_data (data)
		if @buffer
			@buffer << data
		else
			@connection.send_data data
		end
	end

	def disconnect
		close_connection_after_writing
	end

	def connected
		Tortard.log "connected to #{bridge.from}"

		buffer, @buffer = @buffer, nil

		buffer.each {|data|
			@connection.send_data data
		}
	end

	def received (data)
		send_data data
	end

	def unbind
		@connection.close_connection_after_writing if @connection
	end
end

end; end
