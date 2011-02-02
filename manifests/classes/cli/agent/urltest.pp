# Class: mcollective::cli::agent::urltest
#
#
class mcollective::cli::agent::urltest inherits mcollective::cli::base {
	mcollective::plugin::cli { "urltest":
		ensure => present,
		type   => agent,
		repo   => "ripienaar",
		ddl    => true
	}
}
