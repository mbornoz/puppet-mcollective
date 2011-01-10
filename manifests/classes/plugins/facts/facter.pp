# Class: mcollective::plugins::facts::facter
#
#
class mcollective::plugins::facts::facter inherits mcollective::plugins::base {
	
	if ( ! $mcollective_facter_facterlib )  { $mcollective_facter_facterlib = "/var/lib/puppet/lib/facter:/var/lib/puppet/facts" }
	if ( ! $mcollective_facter_cache_time ) { $mcollective_facter_cache_time = "300" }
	
	
	file { "${mcollective::facts_dir}/facter.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/facts/facter/facter.rb",
		mode    => 644
	}
	
	concat::fragment { "mcollective-server.cfg-facts-facter":
		target  => "${mcollective::conf_dir}/server.cfg",
		order   => 25,
		content => template("mcollective/plugins/facts/facter.cfg.erb")
	}
}
