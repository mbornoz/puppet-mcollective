# Class: mcollective::plugins::agent::puppetd
#
#
class mcollective::plugins::agent::puppetd inherits mcollective::plugins::base {
	mcollective::plugin { "puppetd":
		ensure       => present,
		type         => "agent",
		ddl          => true,
		config       => true,
		config_order => 30
	}
}
