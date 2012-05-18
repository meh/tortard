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

class Client
	attr_accessor :bridge

	def post_init
		@buffer = []

		EM.connect bridge.proxy.host, bridge.proxy.port, Connection do |c|
			@connection        = c
			@connection.client = self
		end
	end

	def receive_data (data)
		if @buffer
			@buffer << data
		else
			@connection.send_data data
		end
	end

	def connected
		buffer, @buffer = @buffer, nil

		buffer.each {|data|
			@connection.send_data data
		}
	end

	def received (data)
		send_data data
	end

	def close
		@connection.close_connection_writing

		close_connection_after_writing
	end
end

end; end
