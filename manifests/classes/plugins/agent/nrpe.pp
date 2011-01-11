# Class: mcollective::plugins::agent::nrpe
#
#
class mcollective::plugins::agent::nrpe inherits mcollective::plugins::base {
	mcollective::plugin { "nrpe":
		ensure => present,
		type   => "agent",
		ddl    => true
	}
}
