# Class: mcollective::plugins::agent::apt
#
#
class mcollective::plugins::agent::apt inherits mcollective::plugins::base {
	mcollective::plugin { "apt":
		ensure => present,
		type   => "agent",
		repo   => "mstanislav",
		ddl    => true
	}
}
