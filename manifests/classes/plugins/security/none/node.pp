# Class: mcollective::plugins::security::none::node
#
#
class mcollective::plugins::security::none::node inherits mcollective::plugins::base {
	include mcollective::plugins::security::none
	
	concat::fragment { "mcollective-server.cfg-security-none":
		target  => "${mcollective::params::conf_dir}/server.cfg",
		order   => 20,
		content => template("mcollective/plugins/security/none.cfg.erb")
	}
}
