# Class: mcollective::cli::agent::filemgr
#
#
class mcollective::cli::agent::nrpe inherits mcollective::cli::base {
	mcollective::plugin::cli { "nrpe":
		ensure => present,
		type   => agent,
		ddl    => true
	}
}
