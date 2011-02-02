# Class: mcollective::plugins::agent::stomputil
#
#
class mcollective::plugins::agent::stomputil inherits mcollective::plugins::base {
	mcollective::plugin { "stomputil":
		ensure => present,
		type   => "agent",
		ddl    => true
	}
}
