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

require 'tortard/address'
require 'tortard/map'
require 'tortard/bridge'

class Tortard
	def self.load (path)
		new.tap {|t|
			t.load(path)
		}
	end

	def initialize
		@maps       = []
		@signatures = []
	end

	def load (path)
		path = File.expand_path(path)

		instance_eval File.read(path), path
	end

	def start
		@maps.each {|map|
			@signatures.push EM.start_server map.to.host, map.to.port, Bridge do |c|
				c.map = map
			end
		}
	end

	def stop
		@signatures.each {|sig|
			EM.stop_server sig
		}
	end

	def proxy (host, port = nil)
		@proxy, tmp = port ? Address.new(host, port) : Address.parse(host)

		yield
	ensure
		@proxy = tmp
	end

	def host (host)
		@host, tmp = host, @host

		yield
	ensure
		@host = tmp
	end

	def map (from, to)
		if from.is_a?(Fixnum)
			from = "#{@host}:#{from}"
		end

		Map.new(@proxy || Address.parse('localhost:9050'), Address.parse(from), Address.parse(to))
	end
end
