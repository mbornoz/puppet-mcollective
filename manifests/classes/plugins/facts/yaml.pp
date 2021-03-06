# Class: mcollective::plugins::facts::yaml
#
#
class mcollective::plugins::facts::yaml {
	mcollective::plugin { "yaml":
		ensure       => present,
		core         => true,
		type         => "facts",
		config       => true,
		config_order => 25
	}
	
	file { "${mcollective::params::conf_dir}/facts.yaml":
		ensure  => present,
		content => template("mcollective/plugins/facts/facts.yaml.erb"),
		mode    => 644
	}
}
