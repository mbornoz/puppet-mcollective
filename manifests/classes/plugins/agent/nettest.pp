# Class: mcollective::plugins::agent::nettest
#
#
class mcollective::plugins::agent::nettest inherits mcollective::plugins::base {
	file { "${mcollective::agent_dir}/nettest.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/nettest/nettest.rb",
		mode    => 644
	}
	
	file { "${mcollective::agent_dir}/nettest.ddl":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/nettest/nettest.ddl",
		mode    => 644
	}
}
