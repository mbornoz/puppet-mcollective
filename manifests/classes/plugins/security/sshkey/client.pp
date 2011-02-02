# Class: mcollective::plugins::security::sshkey::client
#
#
class mcollective::plugins::security::sshkey::client inherits mcollective::plugins::base {
	include mcollective::plugins::security::sshkey
	
	concat::fragment { "mcollective-client.cfg-security-sshkey":
		target  => "${mcollective::params::conf_dir}/client.cfg",
		order   => 20,
		content => template("mcollective/plugins/security/sshkey/client.cfg.erb")
	}
}
