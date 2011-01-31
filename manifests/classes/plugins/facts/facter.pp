# Class: mcollective::plugins::facts::facter
#
#
class mcollective::plugins::facts::facter inherits mcollective::plugins::base {
	mcollective::plugin { "facter":
		ensure       => present,
		type         => "facts",
		config       => true,
		config_order => 25
	}
}
