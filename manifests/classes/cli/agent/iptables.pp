# Class: mcollective::cli::agent::iptables
#
#
class mcollective::cli::agent::iptables inherits mcollective::cli::base {
	mcollective::plugin::cli { "iptables":
		ensure     => present,
		type       => agent,
		source     => "puppet:///modules/mcollective/plugins/agent/iptables-junkfilter/mc-iptables",
		ddl        => true,
		ddl_source => "puppet:///modules/mcollective/plugins/agent/iptables-junkfilter/iptables.ddl"
	}
}
