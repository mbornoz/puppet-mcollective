# Class: mcollective::plugin::exim
#
#
class mcollective::plugins::agent::exim inherits mcollective::plugins::base {
	mcollective::plugin { "exim":
		ensure => present,
		type   => "agent",
		repo   => "ripienaar"
	}
	
	mcollective::plugin { "eximserver":
		ensure => present,
		type   => "util",
		source => "puppet:///modules/mcollective/plugins/ripienaar/agent/exim/util/eximserver.rb"
	}
}
