# Class: mcollective::plugins::agent::service
#
#
class mcollective::plugins::agent::service inherits mcollective::plugins::base {
	file { "${mcollective::agent_dir}/service.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/service/puppet-service.rb",
		mode    => 644
	}
	
	file { "${mcollective::agent_dir}/service.ddl":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/service/service.ddl",
		mode    => 644
	}
}