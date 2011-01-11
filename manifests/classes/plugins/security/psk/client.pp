# Class: mcollective::plugins::security::psk::client
#
#
class mcollective::plugins::security::psk::client inherits mcollective::plugins::security::psk {
	concat::fragment { "mcollective-client.cfg-security-psk":
		target  => "${mcollective::conf_dir}/client.cfg",
		order   => 20,
		content => template("mcollective/plugins/security/psk.cfg.erb")
	}
}
