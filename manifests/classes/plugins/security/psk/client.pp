# Class: mcollective::plugins::security::psk::client
#
#
class mcollective::plugins::security::psk::client inherits mcollective::plugins::base {
	concat::fragment { "mcollective-client.cfg-security-psk":
		target  => "${mcollective::params::conf_dir}/client.cfg",
		order   => 20,
		content => template("mcollective/plugins/security/psk.cfg.erb")
	}
}
