# Class: mcollective::plugins::agent::puppetd
#
#
class mcollective::plugins::agent::puppetd inherits mcollective::plugins::base {
	if ( ! $mcollective_classesfile )        { $mcollective_classesfile = "/var/lib/puppet/state/classes.txt" }
	if ( ! $mcollective_puppetd_puppetd )    { $mcollective_puppetd_puppetd = "/usr/sbin/puppetd" }
	if ( ! $mcollective_puppetd_lockfile )   { $mcollective_puppetd_lockfile = "/var/lib/puppet/state/puppetdlock" }
	if ( ! $mcollective_puppetd_statefile )  { $mcollective_puppetd_statefile = "/var/lib/puppet/state/state.yaml" }
	if ( ! $mcollective_puppetd_splaytime )  { $mcollective_puppetd_splaytime = "100" }
	
	mcollective::plugin { "puppetd":
		ensure       => present,
		type         => "agent",
		ddl          => true,
		config       => true,
		config_order => 30
	}
}
