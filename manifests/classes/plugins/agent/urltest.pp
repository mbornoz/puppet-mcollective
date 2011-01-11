# Class: mcollective::plugins::agent::urltest
#
#
class mcollective::plugins::agent::urltest inherits mcollective::plugins::base {
	mcollective::plugin { "urltest":
		ensure => present,
		type   => "agent",
		ddl    => true
	}
}
