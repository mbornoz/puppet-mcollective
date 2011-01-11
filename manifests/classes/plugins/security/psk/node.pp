# Class: mcollective::plugins::security::psk::node
#
#
class mcollective::plugins::security::psk::node inherits mcollective::plugins::security::psk {
	concat::fragment { "mcollective-server.cfg-security-psk":
		target  => "${mcollective::conf_dir}/server.cfg",
		order   => 20,
		content => template("mcollective/plugins/security/psk.cfg.erb")
	}
}
