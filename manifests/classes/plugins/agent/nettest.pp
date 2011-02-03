# Class: mcollective::plugins::agent::nettest
#
#
class mcollective::plugins::agent::nettest {
	mcollective::plugin { "nettest":
		ensure => present,
		type   => "agent",
		ddl    => true
	}
}
