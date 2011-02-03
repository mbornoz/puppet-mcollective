# Class: mcollective::cli::agent::urltest
#
#
class mcollective::cli::agent::urltest {
	mcollective::plugin::cli { "urltest":
		ensure => present,
		type   => agent,
		repo   => "ripienaar",
		ddl    => true
	}
}
