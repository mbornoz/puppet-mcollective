# Class: mcollective::cli::agent::exim
#
#
class mcollective::cli::agent::exim inherits mcollective::cli::base {
	mcollective::plugin::cli { "exim":
		ensure => present,
		type   => agent,
		ddl    => true
	}
}
