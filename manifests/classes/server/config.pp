# Class: mcollective::server::config
#
#
class mcollective::server::config {
	# Setup concat module
	include concat::setup
	
	# Setup server config file for concat module and include first fragment
	concat { "${mcollective::conf_dir}/server.cfg":
		owner   => root,
		group   => root,
		require => [ File["$mcollective::conf_dir"], Class["mcollective::server::install"], Class["mcollective::common"] ], 
		notify  => Class["mcollective::server::service"]
	}
	
	concat::fragment { "mcollective-server.cfg-base":
		target  => "${mcollective::conf_dir}/server.cfg",
		order   => 10,
		content => template("mcollective/server.cfg.erb")
	}
	
	if ( $mcollective_factsource == "yaml" ) {
		concat::fragment { "mcollective-server.cfg-facts-yaml":
			target  => "${mcollective::conf_dir}/server.cfg",
			order   => 25,
			content => template("mcollective/plugins/facts/yaml.cfg.erb")
		}
	}
}
