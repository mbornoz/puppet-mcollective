# Class: mcollective::plugins::agent::urltest
#
#
class mcollective::plugins::agent::urltest {
	mcollective::plugin { "urltest":
		ensure => present,
		type   => "agent",
		repo   => "ripienaar",
		ddl    => true
	}
}
