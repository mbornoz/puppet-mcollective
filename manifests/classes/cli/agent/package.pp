# Class: mcollective::cli::agent::package
#
#
class mcollective::cli::agent::package inherits mcollective::cli::base {
	mcollective::plugin::cli { "package":
		ensure => present,
		type   => agent,
		ddl    => true
	}
}
