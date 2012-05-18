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

require 'tortard/bridge/client'
require 'tortard/bridge/connection'

class Tortard

class Bridge
	attr_reader :proxy, :from, :to, :clients

	def initialize (proxy, from, to)
		@proxy = proxy
		@from  = from
		@to    = to

		@clients = []
	end

	def start
		@signature = EM.start_server to.host, to.port, Client do |c|
			c.bridge = self
			c.connect

			@clients << c
		end
	end

	def stop
		@clients.each(&:disconnect)

		EM.stop_server @signature
	end
end

end
