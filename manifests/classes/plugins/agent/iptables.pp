# Class: mcollective::plugins::agent::iptables
#
#
class mcollective::plugins::agent::iptables inherits mcollective::plugins::base {
	# TODO: require iptables and have junk filter rule
	mcollective::plugin { "iptables":
		ensure     => present,
		type       => "agent",
		source     => "puppet:///modules/mcollective/plugins/agent/iptables-junkfilter/iptables.rb",
		ddl        => true,
		ddl_source => "puppet:///modules/mcollective/plugins/agent/iptables-junkfilter/iptables.ddl"
	}
}
