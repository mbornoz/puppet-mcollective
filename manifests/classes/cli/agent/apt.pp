# Class: mcollective::cli::agent::apt
#
#
class mcollective::cli::agent::apt {
	mcollective::plugin::cli { "apt":
		ensure => present,
		type   => agent,
		repo   => "mstanislav",
		ddl    => true
	}
}
