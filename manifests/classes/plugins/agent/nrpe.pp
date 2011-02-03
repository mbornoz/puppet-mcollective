# Class: mcollective::plugins::agent::nrpe
#
#
class mcollective::plugins::agent::nrpe {
	mcollective::plugin { "nrpe":
		ensure => present,
		type   => "agent",
		ddl    => true
	}
}
