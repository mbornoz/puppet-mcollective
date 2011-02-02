# Class: mcollective::plugins::facts::facter
#
#
class mcollective::plugins::facts::facter inherits mcollective::plugins::base {
	mcollective::plugin { "facter":
		ensure       => present,
		type         => "facts",
		source       => "puppet:///modules/mcollective/plugins/puppetlabs/facts/facter/facter_facts.rb",
		target       => "${mcollective::params::facts_dir}/facter_facts.rb",
		config       => true,
		config_order => 25
	}
	
	# Cleanup the previous version of the plugin if present since we are now supporting 1.1
	file { "${mcollective::params::facts_dir}/facter.rb":
		ensure => absent
	}
}
