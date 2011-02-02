# Class: mcollective::plugins::security::sshkey::node
#
#
class mcollective::plugins::security::sshkey::node inherits mcollective::plugins::base {
	include mcollective::plugins::security::sshkey
	
	concat::fragment { "mcollective-server.cfg-security-sshkey":
		target  => "${mcollective::params::conf_dir}/server.cfg",
		order   => 20,
		content => template("mcollective/plugins/security/sshkey/node.cfg.erb")
	}
}
