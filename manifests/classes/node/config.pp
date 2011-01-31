# Class: mcollective::node::config
#
#
class mcollective::node::config {
	# Setup concat module
	include concat::setup
	
	# Setup node config file for concat module and include first fragment
	concat { "${mcollective::params::conf_dir}/server.cfg":
		owner   => root,
		group   => root,
		require => [ File["$mcollective::params::conf_dir"], Class["mcollective::node::install"], Class["mcollective::common"] ], 
		notify  => Class["mcollective::node::service"]
	}
	
	concat::fragment { "mcollective-server.cfg-base":
		target  => "${mcollective::params::conf_dir}/server.cfg",
		order   => 10,
		content => template("mcollective/server.cfg.erb")
	}
	
	if ( $mcollective::params::factsource == "yaml" ) {
		concat::fragment { "mcollective-server.cfg-facts-yaml":
			target  => "${mcollective::params::conf_dir}/server.cfg",
			order   => 25,
			content => template("mcollective/plugins/facts/yaml.cfg.erb")
		}
	}
}
