# Class: mcollective::cli::agent::service
#
#
class mcollective::cli::agent::service inherits mcollective::cli::base {
	mcollective::plugin::cli { "service":
		ensure => present,
		type   => agent,
		ddl    => true
	}
}
