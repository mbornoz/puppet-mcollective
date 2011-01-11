# Class: mcollective::plugins::registration::mongodb
#
#
class mcollective::plugins::agent::registration::mongodb inherits mcollective::plugins::base {
	if ( ! $mcollective_registration_mongohost )  { $mcollective_registration_mongohost = "localhost" }
	if ( ! $mcollective_registration_mongohdb )   { $mcollective_registration_mongodb = "puppet" }
	if ( ! $mcollective_registration_collection ) { $mcollective_registration_collection = "nodes" }
	
	mcollective::plugin { "registration":
		ensure        => present,
		type          => "agent",
		source        => "puppet:///modules/mcollective/plugins/agent/registration-mongodb/registration.rb",
		config        => true,
		config_source => template("mcollective/plugins/registration/mongodb.cfg.erb"),
		config_order  => 20
	}
}
