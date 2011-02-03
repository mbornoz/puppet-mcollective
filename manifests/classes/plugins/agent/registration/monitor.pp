# Class: mcollective::plugins::agent::registration
#
#
class mcollective::plugins::agent::registration::monitor {
	mcollective::plugin { "registration":
		ensure => present,
		type   => "agent",
		source => "puppet:///modules/mcollective/plugins/puppetlabs/agent/registration-monitor/registration.rb"
	}
	
	file { "/usr/bin/check_mcollective":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/puppetlabs/agent/registration-monitor/check_mcollective.rb",
		mode    => 755
	}
}
