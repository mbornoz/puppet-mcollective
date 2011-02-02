# Class: mcollective::plugins::agent::svnagent
#
#
class mcollective::plugins::agent::svnagent inherits mcollective::plugins::base {
	mcollective::plugin { "svnagent":
		ensure       => present,
		type         => "agent",
		repo         => "rottenbytes",
		ddl          => true
	}
}
