# Class: mcollective::cli::agent::xen
#
#
class mcollective::cli::agent::xen {
	mcollective::plugin::cli { "xen":
		ensure => present,
		type   => agent,
		repo   => "rottenbytes"
	}
}
