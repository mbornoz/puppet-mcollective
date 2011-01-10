# Class: mcollective::plugins::agent::puppetca
#
#
class mcollective::plugins::agent::puppetca inherits mcollective::plugins::base {
	file { "${mcollective::agent_dir}/puppetca.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/puppetca/puppetca.rb",
		mode    => 644
	}

	file { "${mcollective::agent_dir}/puppetca.ddl":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/puppetca/puppetca.ddl",
		mode    => 644
	}
}