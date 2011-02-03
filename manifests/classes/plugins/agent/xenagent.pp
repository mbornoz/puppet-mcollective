# Class: mcollective::plugins::agent::xenagent
#
#
class mcollective::plugins::agent::xenagent {
	include ruby::xen
	
	mcollective::plugin { "xenagent":
		ensure       => present,
		type         => "agent",
		repo         => "rottenbytes",
		ddl          => true
	}
}
