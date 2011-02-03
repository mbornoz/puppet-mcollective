# Class: mcollective::cli::agent::service
#
#
class mcollective::cli::agent::service {
	mcollective::plugin::cli { "service":
		ensure => present,
		type   => agent,
		ddl    => true
	}
}
