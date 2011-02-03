# Class: mcollective::plugins::registration::meta
#
#
class mcollective::plugins::registration::meta {
	mcollective::plugin { "meta":
		ensure       => present,
		type         => "registration",
		config       => true,
		config_order => 15
	}
}
