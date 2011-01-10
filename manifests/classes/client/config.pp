# Class: mcollective::client::config
#
#
class mcollective::client::config {
	# Setup concat module
	include concat::setup
	
	# Setup client config file for concat module and include first fragment
	concat { "${mcollective::conf_dir}/client.cfg":
		owner   => root,
		group   => root,
		require => [ File["$mcollective::conf_dir"], Class["mcollective::client::install"], Class["mcollective::common"] ]
	}
	
	concat::fragment { "mcollective-client.cfg-base":
		target  => "${mcollective::conf_dir}/client.cfg",
		order   => 10,
		content => template("mcollective/client.cfg.erb")
	}
}