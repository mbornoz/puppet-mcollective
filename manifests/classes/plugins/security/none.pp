# Class: mcollective::plugins::security::none
#
#
class mcollective::plugins::security::none {
	mcollective::plugin { "none":
		ensure       => present,
		type         => "security"
	}
}
