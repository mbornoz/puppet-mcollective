# Class: mcollective::plugins::agent::xenagent
#
#
class mcollective::plugins::agent::xenagent inherits mcollective::plugins::base {
	include ruby::xen
	
	mcollective::plugin { "xenagent":
		ensure       => present,
		type         => "agent",
		repo         => "rottenbytes",
		ddl          => true
	}
}
