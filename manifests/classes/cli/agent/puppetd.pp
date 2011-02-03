# Class: mcollective::cli::agent::puppetd
#
#
class mcollective::cli::agent::puppetd {
	mcollective::plugin::cli { "puppetd":
		ensure => present,
		type   => agent,
		ddl    => true
	}
}
