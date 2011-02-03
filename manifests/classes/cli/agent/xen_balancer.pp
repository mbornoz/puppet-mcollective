# Class: mcollective::cli::agent::xen_balancer
#
#
class mcollective::cli::agent::xen_balancer {
	mcollective::plugin::cli { "xen-balancer":
		ensure => present,
		type   => agent,
		repo   => "rottenbytes"
	}
}
