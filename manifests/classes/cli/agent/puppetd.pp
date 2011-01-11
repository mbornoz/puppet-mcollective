# Class: mcollective::cli::agent::puppetd
#
#
class mcollective::cli::agent::puppetd inherits mcollective::cli::base {
	mcollective::plugin::cli { "puppetd":
		ensure => present,
		type   => agent,
		ddl    => true
	}
}
