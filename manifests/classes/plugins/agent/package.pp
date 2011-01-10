# Class: mcollective::plugins::agent::package
#
#
class mcollective::plugins::agent::package inherits mcollective::plugins::base {
	file { "${mcollective::agent_dir}/package.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/package/puppet-package.rb",
		mode    => 644
	}
	
	file { "${mcollective::agent_dir}/package.ddl":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/package/package.ddl",
		mode    => 644
	}
}