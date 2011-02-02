# Class: mcollective::cli::agent::eximctl
#
#
class mcollective::cli::agent::eximctl inherits mcollective::cli::base {
	mcollective::plugin::cli { "eximctl":
		ensure => present,
		type   => agent
	}
	
	mcollective::plugin { "eximclient":
		ensure => present,
		type   => "util",
		source => "puppet:///modules/mcollective/plugins/ripienaar/agent/exim/util/eximclient.rb"
	}
}
