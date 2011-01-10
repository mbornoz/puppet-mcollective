# Class: mcollective::plugins::agent::puppetd
#
#
class mcollective::plugins::agent::puppetd inherits mcollective::plugins::base {
	if ( ! $mcollective_classesfile )        { $mcollective_classesfile = "/var/lib/puppet/state/classes.txt" }
	if ( ! $mcollective_puppetd_puppetd )    { $mcollective_puppetd_puppetd = "/usr/sbin/puppetd" }
	if ( ! $mcollective_puppetd_lockfile )   { $mcollective_puppetd_lockfile = "/var/lib/puppet/state/puppetdlock" }
	if ( ! $mcollective_puppetd_statefile )  { $mcollective_puppetd_statefile = "/var/lib/puppet/state/state.yaml" }
	if ( ! $mcollective_puppetd_splaytime )  { $mcollective_puppetd_splaytime = "100" }
	
	file { "${mcollective::agent_dir}/puppetd.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/puppetd/puppetd.rb",
		mode    => 644
	}
	
	file { "${mcollective::agent_dir}/puppetd.ddl":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/puppetd/puppetd.ddl",
		mode    => 644
	}
	
	concat::fragment { "mcollective-server.cfg-agent-puppetd":
		target  => "${mcollective::conf_dir}/server.cfg",
		order   => 30,
		content => template("mcollective/plugins/agent/puppet.cfg.erb")
	}
}
