# Class: mcollective::plugins::agent::apt
#
#
class mcollective::plugins::agent::apt {
	mcollective::plugin { "apt":
		ensure => present,
		type   => "agent",
		repo   => "mstanislav",
		ddl    => true
	}
}
