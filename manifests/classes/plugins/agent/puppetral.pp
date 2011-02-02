# Class: mcollective::plugins::agent::puppetral
#
#
class mcollective::plugins::agent::puppetral inherits mcollective::plugins::base {
	mcollective::plugin { "puppetral":
		ensure => present,
		type   => "agent"
	}
}
