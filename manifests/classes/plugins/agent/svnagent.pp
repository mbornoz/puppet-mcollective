# Class: mcollective::plugins::agent::svnagent
#
#
class mcollective::plugins::agent::svnagent {
	mcollective::plugin { "svnagent":
		ensure       => present,
		type         => "agent",
		repo         => "rottenbytes",
		ddl          => true
	}
}
