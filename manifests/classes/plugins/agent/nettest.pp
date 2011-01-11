# Class: mcollective::plugins::agent::nettest
#
#
class mcollective::plugins::agent::nettest inherits mcollective::plugins::base {
	mcollective::plugin { "nettest":
		ensure => present,
		type   => "agent",
		ddl    => true
	}
}
