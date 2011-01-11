# Class: mcollective::plugins::agent::puppetca
#
#
class mcollective::plugins::agent::puppetca inherits mcollective::plugins::base {
	mcollective::plugin { "puppetca":
		ensure => present,
		type   => "agent",
		ddl    => true
	}
}