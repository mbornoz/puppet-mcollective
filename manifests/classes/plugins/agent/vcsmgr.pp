# Class: mcollective::plugins::agent::vcsmgr
#
#
class mcollective::plugins::agent::vcsmgr inherits mcollective::plugins::base {
	mcollective::plugin { "vcsmgr":
		ensure       => present,
		type         => "agent",
		repo         => "ripienaar",
		ddl          => true,
		config       => true,
		config_order => 31
	}
}
