# Class: mcollective::plugins::agent::nrpe
#
#
class mcollective::plugins::agent::nrpe inherits mcollective::plugins::base {
	file { "${mcollective::agent_dir}/nrpe.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/nrpe/nrpe.rb",
		mode    => 644
	}

	file { "${mcollective::agent_dir}/nrpe.ddl":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/nrpe/nrpe.ddl",
		mode    => 644
	}
}