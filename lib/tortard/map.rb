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

require 'tortard/address'

class Tortard

class Map
	attr_reader :socks, :from, :to

	def initialize (socks, from, to)
		@socks = socks
		@from  = from
		@to    = to
	end
end

end
