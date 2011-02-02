# Class: mcollective::plugins::registration::meta
#
#
class mcollective::plugins::registration::meta inherits mcollective::plugins::base {
	mcollective::plugin { "meta":
		ensure       => present,
		type         => "registration",
		config       => true,
		config_order => 15
	}
}
