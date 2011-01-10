# Class: mcollective::plugins::registration::mongodb
#
#
class mcollective::plugins::registration::mongodb inherits mcollective::plugins::base {
	if ( ! $mcollective_registration_mongohost )  { $mcollective_registration_mongohost = "localhost" }
	if ( ! $mcollective_registration_mongohdb )   { $mcollective_registration_mongodb = "puppet" }
	if ( ! $mcollective_registration_collection ) { $mcollective_registration_collection = "nodes" }
	
	file { "${mcollective::agent_dir}/registration.rb":
		ensure  => present,
		source  => "puppet:///modules/mcollective/plugins/agent/registration-mongodb/registration.rb",
		mode    => 644
	}
	
	concat::fragment { "mcollective-server.cfg-registration-mongodb":
		target  => "${mcollective::conf_dir}/server.cfg",
		order   => 20,
		content => template("mcollective/plugins/registration/mongodb.cfg.erb")
	}
}
