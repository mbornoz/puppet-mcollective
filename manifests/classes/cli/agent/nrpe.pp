# Class: mcollective::cli::agent::nrpe
#
#
class mcollective::cli::agent::nrpe {
	mcollective::plugin::cli { "nrpe":
		ensure => present,
		type   => agent,
		ddl    => true
	}
}
