# Class: mcollective::cli::agent::xen
#
#
class mcollective::cli::agent::xen inherits mcollective::cli::base {
	mcollective::plugin::cli { "xen":
		ensure => present,
		type   => agent,
		repo   => "rottenbytes"
	}
}
