# Class: mcollective::plugins::agent::iptables
#
#
class mcollective::plugins::agent::iptables inherits mcollective::plugins::base {
	# TODO: require iptables and have junk filter rule
	file { "${mcollective::agent_dir}/iptables.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/iptables-junkfilter/iptables.rb",
		mode    => 644
	}
	
	file { "${mcollective::agent_dir}/iptables.ddl":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/iptables-junkfilter/iptables.ddl",
		mode    => 644
	}
}