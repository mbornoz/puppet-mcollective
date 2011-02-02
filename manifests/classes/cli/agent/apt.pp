# Class: mcollective::cli::agent::apt
#
#
class mcollective::cli::agent::apt inherits mcollective::cli::base {
	mcollective::plugin::cli { "apt":
		ensure => present,
		type   => agent,
		repo   => "mstanislav",
		ddl    => true
	}
}
