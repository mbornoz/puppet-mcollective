# Class: mcollective::plugin::exim
#
#
class mcollective::plugins::agent::exim inherits mcollective::plugins::base {
	mcollective::plugin { "exim":
		ensure => present,
		type   => "agent"
	}
	
	mcollective::plugin { "eximclient":
		ensure => present,
		type   => "util"
	}
	
	mcollective::plugin { "eximserver":
		ensure => present,
		type   => "util"
	}
}
