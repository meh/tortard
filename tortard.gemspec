Gem::Specification.new {|s|
	s.name         = 'tortard'
	s.version      = '0.0.1'
	s.author       = 'meh.'
	s.email        = 'meh@paranoici.org'
	s.homepage     = 'http://github.com/meh/tortard'
	s.platform     = Gem::Platform::RUBY
	s.summary      = 'Map SOCKS address:port to real:port.'

	s.files         = `git ls-files`.split("\n")
	s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
	s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
	s.require_paths = ['lib']

	s.add_dependency 'eventmachine', '>= 1.0.0.beta.4'
	s.add_dependency 'em-socksify'
}
