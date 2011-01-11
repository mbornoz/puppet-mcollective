# Class: mcollective::plugins::agent::registration
#
#
class mcollective::plugins::agent::registration::monitor inherits mcollective::plugins::base {
	mcollective::plugin { "registration":
		ensure => present,
		type   => "agent",
		source => "puppet:///modules/mcollective/plugins/agent/registration-monitor/registration.rb"
	}
	
	file { "/usr/bin/check_mcollective":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/registration-monitor/check_mcollective.rb",
		mode    => 755
	}
}
