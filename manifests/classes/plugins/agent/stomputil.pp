# Class: mcollective::plugins::agent::stomputil
#
#
class mcollective::plugins::agent::stomputil {
	mcollective::plugin { "stomputil":
		ensure => present,
		type   => "agent",
		ddl    => true
	}
}
