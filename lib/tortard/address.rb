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

class Tortard

class Address
	def self.parse (text)
		new(*text.split(?:))
	end

	attr_reader :host, :port

	def initialize (host, port)
		@host = host
		@port = port.to_i
	end
end

end
