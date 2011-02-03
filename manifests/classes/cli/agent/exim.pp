# Class: mcollective::cli::agent::exim
#
#
class mcollective::cli::agent::exim {
	mcollective::plugin::cli { "exim":
		ensure => present,
		type   => agent,
		ddl    => true
	}
}
