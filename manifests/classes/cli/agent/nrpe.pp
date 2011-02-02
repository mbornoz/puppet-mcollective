# Class: mcollective::cli::agent::nrpe
#
#
class mcollective::cli::agent::nrpe inherits mcollective::cli::base {
	mcollective::plugin::cli { "nrpe":
		ensure => present,
		type   => agent,
		ddl    => true
	}
}
