# Class: mcollective::plugins::agent::vcsmgr
#
#
class mcollective::plugins::agent::vcsmgr inherits mcollective::plugins::base {
	file { "${mcollective::agent_dir}/vcsmgr.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/vcsmgr/vcsmgr.rb",
		mode    => 644
	}

	file { "${mcollective::agent_dir}/vcsmgr.ddl":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/vcsmgr/vcsmgr.ddl",
		mode    => 644
	}
}
