# Class: mcollective::plugins::security::psk
#
#
class mcollective::plugins::security::psk inherits mcollective::plugins::base {
	if ( ! $mcollective_psk_password ) { $mcollective_psk_password = "defineme" }
	
	concat::fragment { "mcollective-server.cfg-security-psk":
		target  => "${mcollective::conf_dir}/server.cfg",
		order   => 20,
		content => template("mcollective/plugins/security/psk.cfg.erb")
	}
}
