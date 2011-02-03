# Class: mcollective::plugins::registration::mongodb
#
#
class mcollective::plugins::agent::registration::mongodb {
	mcollective::plugin { "registration":
		ensure        => present,
		type          => "agent",
		source        => "puppet:///modules/mcollective/plugins/puppetlabs/agent/registration-mongodb/registration.rb",
		config        => true,
		config_source => template("mcollective/plugins/registration/mongodb.cfg.erb"),
		config_order  => 20
	}
}
