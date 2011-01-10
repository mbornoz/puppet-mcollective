# Class: mcollective::plugins::facts::yaml
#
#
class mcollective::plugins::facts::yaml inherits mcollective::plugins::base {
	file { "${mcollective::conf_dir}/facts.yaml":
		ensure  => present,
		source  => template("mcollective/plugins/facts/facts.yaml.erb"),
		mode    => 644
	}
	
	concat::fragment { "mcollective-server.cfg-facts-yaml":
		target  => "${mcollective::conf_dir}/server.cfg",
		order   => 25,
		content => template("mcollective/plugins/facts/yaml.cfg.erb")
	}
}
