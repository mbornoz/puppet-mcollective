# Class: mcollective::plugins::agent::registration
#
#
class mcollective::plugins::agent::registration inherits mcollective::plugins::base {
	file { "${mcollective::agent_dir}/registration.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/registration-monitor/registration.rb",
		mode    => 644
	}
	
	file { "/usr/bin/check_mcollective":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/registration-monitor/check_mcollective.rb",
		mode    => 644
	}
}