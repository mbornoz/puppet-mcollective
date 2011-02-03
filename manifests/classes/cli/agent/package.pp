# Class: mcollective::cli::agent::package
#
#
class mcollective::cli::agent::package {
	mcollective::plugin::cli { "package":
		ensure => present,
		type   => agent,
		ddl    => true
	}
}
