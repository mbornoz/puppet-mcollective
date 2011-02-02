# Class: mcollective::plugins::security::none::client
#
#
class mcollective::plugins::security::none::client inherits mcollective::plugins::base {
	include mcollective::plugins::security::none
	
	concat::fragment { "mcollective-client.cfg-security-none":
		target  => "${mcollective::params::conf_dir}/client.cfg",
		order   => 20,
		content => template("mcollective/plugins/security/none.cfg.erb")
	}
}
