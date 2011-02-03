# Class: mcollective::plugins::agent::puppetca
#
#
class mcollective::plugins::agent::puppetca {
	mcollective::plugin { "puppetca":
		ensure => present,
		type   => "agent",
		ddl    => true
	}
}