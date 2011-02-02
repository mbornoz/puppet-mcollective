# Class: mcollective::cli::agent::stomputil
#
#
class mcollective::cli::agent::stomputil inherits mcollective::cli::base {
	mcollective::plugin::cli { "stomputil":
		ensure => present,
		type   => agent,
		source => "puppet:///modules/mcollective/plugins/puppetlabs/agent/stomputil/mc-peermap",
		target => "/usr/sbin/mc-peermap",
		ddl    => true
	}
}
