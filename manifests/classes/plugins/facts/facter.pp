# Class: mcollective::plugins::facts::facter
#
#
class mcollective::plugins::facts::facter inherits mcollective::plugins::base {
	if ( ! $mcollective_facter_facterlib )  { $mcollective_facter_facterlib = "/var/lib/puppet/lib/facter:/var/lib/puppet/facts" }
	if ( ! $mcollective_facter_cache_time ) { $mcollective_facter_cache_time = "300" }
	
	mcollective::plugin { "facter":
		ensure       => present,
		type         => "facts",
		config       => true,
		config_order => 25
	}
}
